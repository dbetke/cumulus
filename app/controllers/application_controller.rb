class ApplicationController < ActionController::Base
  protect_from_forgery

  # Placeholder until we get User logic
  def current_user
    false
  end

end
