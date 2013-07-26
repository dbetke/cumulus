class Skill < ActiveRecord::Base
  attr_accessible :tag_id, :user_id, :weight

  #
  # Associations
  #

	belongs_to :user
	belongs_to :tag

  #
  # Scopes
  #

  scope :by_weight, ->{ order(:weight) }

end
