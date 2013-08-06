# add to spec/models/tag_spec.rb
require 'spec_helper'

describe "creating Factory instances" do
  it "should succeed creating a new :tag from the Factory" do
    lambda { create(:tag) }.should_not raise_error
  end

  #
  # Validations
  #

  describe "validations" do
		subject { create(:tag) }

		it { should validate_presence_of(:name) }
		it { should validate_uniqueness_of(:name) }
  end

	#
	# Associations
	#

	describe "associations" do
		subject { create(:tag) }

		it { should have_many(:skills) }
	end
end
