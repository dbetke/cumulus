class CardsController < ApplicationController
  def front
		#create user/session if one does not exsist
		#get tags/skills
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
  end

  def update
		#update tags & skills
  end

  def show
		#get tags
  end
end
