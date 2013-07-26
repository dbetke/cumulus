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

		#it { should validate_presence_of(:cookie) } Will not pass because of callback method
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
  # Callbacks
  #

  describe "Callbacks" do
    describe "before_validation" do
      describe "create_cookie" do
        it "should not have a cookie when a User is new" do
          User.new.cookie.should be nil
        end

        it "should create a valid User" do
          User.create.should be_valid
        end

        it "should have a cookie when a User is created" do
          User.create.cookie.should_not be nil
        end
      end
    end
  end

  #
  # Cookie Methods
  #

  describe "Cookie Methods" do
    describe "create_cookie" do
      let(:user) { User.new }

      it "should not have a cookie when it is new" do
        user.cookie.should be nil
      end

      it "should have a cookie after create_cookie" do
        user.create_cookie
        user.cookie.should_not be nil
      end

      it "should be an MD5 checksum cookie" do
        user.create_cookie
        user.cookie.length.should == 32
      end
    end
  end
end
