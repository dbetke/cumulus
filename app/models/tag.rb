class Tag < ActiveRecord::Base
  attr_accessible :name
	has_many :skills
end
