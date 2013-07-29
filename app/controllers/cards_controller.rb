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
		Skill.document_user_info(params[:name], params[:box1], params[:box2], current_user)
 		respond_to do |format|
      format.html
    end
	end

  def update
    # respond_to do |format|
    #   if @user.save
    #     format.html { redirect_to back_of_card_path, notice: 'Card was successfully created.' }
    #     format.json { render json: @user, status: :created, location: @user }
    #   else
    #     format.html { render action: "front" }
    #     format.json { render json: @user.errors, status: :unprocessable_entity }
    #   end
    # end
	end

  def show
		#get tags
  end

end
