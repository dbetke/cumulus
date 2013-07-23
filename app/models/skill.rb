class Skill < ActiveRecord::Base
  attr_accessible :tag_id, :user_id, :weight
	belongs_to :user
	belongs_to :tag
end
