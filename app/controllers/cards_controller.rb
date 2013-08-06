class CardsController < ApplicationController
  before_filter :check_cookie

  def front
    @skills = current_user.skills.by_weight.includes(:tag) if current_user

 		respond_to do |format|
      format.html
    end
  end

  def create
    Skill.document_skills(params[:tags], params[:weights], current_user)

 		respond_to do |format|
      if current_user.skills.any?
        format.html { redirect_to back_of_card_path }
      else
        format.html { redirect_to front_of_card_path }
      end
    end
  end

  def back

 		respond_to do |format|
      format.html
    end
	end

  def update
		@current_user.update_attributes(params[:user])
    #Skill.document_user_info(params[:name], params[:box1], params[:box2], current_user)

 		respond_to do |format|
      format.html { redirect_to card_path }
    end
	end

  def show
    @skills = current_user.skills.by_weight.includes(:tag) if current_user
  end

end
