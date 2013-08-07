class Skill < ActiveRecord::Base
  attr_accessible :tag_id, :user_id, :weight

  #
  # Validations
  #

  validates :user_id, presence: true, numericality: true
  validates :tag_id,  presence: true, numericality: true, uniqueness: { scope: :user_id }
  validates :weight,  presence: true, numericality: true

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
  # Document Skills
  #

  def self.document_skills tags, weights, user
    tags.each_with_index do |tag, index|
      if tag = Tag.find_or_create_by_name(tag.downcase)
        user.skills.create(tag_id: tag.id, weight: weights[index])
      end
    end
  end
end
