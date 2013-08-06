# add to spec/models/skill_spec.rb
require 'spec_helper'

describe "creating Factory instances" do
  it "should succeed creating a new :skill from the Factory" do
    lambda { create(:skill) }.should_not raise_error
  end

  #
  # Validations
  #

  describe "validations" do
		subject { create(:skill) }

		it { should validate_uniqueness_of(:tag_id).scoped_to(:user_id) }
  end

	#
	# Associations
	#

	describe "associations" do
		subject { create(:skill) }

		it { should belong_to(:user) }
		it { should belong_to(:tag) }
	end

  #
  # Save Skills
  #

  describe "document_skills" do
    let(:user) { create(:user) }
    let(:ruby) { create(:tag, name: "ruby") }
    let(:html) { create(:tag, name: "html") }

    context "testing errors" do
      it "should raise an error if the proper variables are not passed" do
        lambda{ Skill.document_skills }.should raise_error
      end

      it "should raise an error if the proper variables are not arrays" do
        lambda{ Skill.document_skills "lavergne", "shirley", "bozo" }.should raise_error
      end

    	it "should test that skills are saved properly" do
        lambda{ Skill.document_skills ["test2", "test1", "test2"], ["22", "1", "2"], :user }.should_not raise_error
			end
    end

    it "should test that the proper weights are assigned"
    it "should test that tags are not duplicated"
  end

end
