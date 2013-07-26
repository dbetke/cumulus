# add to spec/models/user_spec.rb
require 'spec_helper'

describe "creating Factory instances" do
  it "should succeed creating a new :user from the Factory" do
    lambda { create(:user) }.should_not raise_error
  end

	#
	# Validations
	#

	describe "associations" do
		subject { create(:user) }

		it { should validate_presence_of(:cookie) }
		it { should validate_uniqueness_of(:cookie) }
	end

	#
	# Associations
	#

	describe "associations" do
		subject { create(:user) }

		it { should have_many(:skills) }
		it { should have_many(:tags) }
	end

  #
  # Cookie Methods
  #

  describe "Cookie Methods" do
    describe "cookie_cutter" do
      it "should be an MD5 checksum cookie" do
        User.cookie_cutter.length.should == 32
      end
    end

    describe "gradual engagement" do
      it "should create a valid User" do
        User.gradual_engagement.should be_valid
      end

      it "should have a cookie when a User is created" do
        User.gradual_engagement.cookie.should_not be nil
      end
    end
  end
end
