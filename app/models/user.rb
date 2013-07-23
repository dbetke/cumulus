class User < ActiveRecord::Base
  attr_accessible :box1, :box2, :cookie, :name, :pay_pal
	has_many :skills
	has_many :tags, :through => :skills
end
