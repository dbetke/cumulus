class Skill < ActiveRecord::Base
  attr_accessible :tag_id, :user_id, :weight

  #
  # Validations
  #

  validates :tag_id, :uniqueness => {:scope => :user_id}

  #
  # Associations
  #

	belongs_to :user
	belongs_to :tag

  #
  # Scopes
  #

  scope :by_weight, ->{ order(:weight) }

  #
  # Dosument Skills
  #

  def self.document_skills tags, weights, user
    tags.each_with_index do |tag, index|
      tag = Tag.find_or_create_by_name(tag.downcase)
      user.skills.create(tag_id: tag.id, weight: weights[index])
    end
  end

end
