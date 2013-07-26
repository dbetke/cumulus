class User < ActiveRecord::Base
  attr_accessible :box1, :box2, :cookie, :name, :pay_pal

  #
  # Validations
  #

  validates :cookie, presence: true, uniqueness: true

  #
  # Associations
  #

	has_many :skills
	has_many :tags, :through => :skills

  #
  # Cookie Methods
  #

  def self.gradual_engagement
    User.create(cookie: cookie_cutter)
  end

  def self.cookie_cutter
    Digest::MD5.hexdigest("#{Time.now}-#{rand(1..1000)}")
  end

end
