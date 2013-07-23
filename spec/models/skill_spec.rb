# add to spec/models/skill_spec.rb
require 'spec_helper'

describe "creating Factory instances" do
  it "should succeed creating a new :skill from the Factory" do
    lambda { create(:skill) }.should_not raise_error
  end

	#
	# Associations
	#

	describe "associations" do
		subject { create(:skill) }

		it { should belong_to(:user) }
		it { should belong_to(:tag) }
	end

end