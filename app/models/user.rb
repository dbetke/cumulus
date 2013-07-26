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
  # Callbacks
  #

  before_validation :create_cookie

  #
  # Cookie Methods
  #

  def create_cookie
    self.cookie = Digest::MD5.hexdigest("#{Time.now}-#{rand(1..1000)}") if self.cookie.nil?
  end

end
