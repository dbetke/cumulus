class CardsController < ApplicationController

  def front
		#create user/session if one does not exsist
    #User.find_or_create_by_cookie

    # Get Skills
    if current_user
      @skills = current_user.skills.by_weight.includes(:tags)
    end

 		respond_to do |format|
      format.html # front.html.erb
    end
  end

  def create
    @skill= Skill.new(params[:skill])
    @tag = Tag.new(params[:tag])
		@tag.save
		@skill.tag_id = @tag.id
		@skill.save
		redirect_to front_of_card_path, notice: 'Skill was successfully created.'
		#get user/session
		#save skills & tags
  end

  def back
		#get user/session
		@user= User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to back_of_card_path, notice: 'Card was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "front" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
	end

  def update
		#update tags & skills
		#PUT
	end

  def show
		#get tags
  end

end
