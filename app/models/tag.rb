class Tag < ActiveRecord::Base
  attr_accessible :name
	has_many :skills
  validates :name, presence: true, uniqueness: true
end
