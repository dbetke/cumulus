class Skill < ActiveRecord::Base
	belongs_to :user
	belongs_to :tag
  attr_accessible :tag_id, :user_id, :weight
end
