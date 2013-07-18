class User < ActiveRecord::Base
	has_many :skills
	has_many :tags, :through :skills
  attr_accessible :box1, :box2, :cookie,, :name,, :pay_pal
end
