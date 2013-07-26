class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user

  def current_user
    @current_user
  end

private

  def check_cookie
    begin
      cookies[:cardulus].present? ? get_user : make_user
    rescue ActiveRecord::RecordNotFound
      make_user
    end
  end

  def get_user
    @current_user = User.find_by_cookie(cookies[:cardulus])
  end

  def make_user
    @current_user = User.gradual_engagement
    cookies[:cardulus] = @current_user.cookie
  end

end
