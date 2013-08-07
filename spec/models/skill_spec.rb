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

  describe "document_skills", focus: true do
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

    	it "should not raise an error with the proper data structures" do
        lambda{ Skill.document_skills ["test1", "test2", "test3"], ["22", "1", "2"], user }.should_not raise_error
			end

    	it "should not raise an error with duplicated data" do
        lambda{ Skill.document_skills ["test1", "test1", "test2"], ["22", "1", "2"], user }.should_not raise_error
			end

    	it "should not raise an error with an empty element in the arrays" do
        lambda{ Skill.document_skills ["test2", "test1", ""], ["22", "1", ""], user }.should_not raise_error
			end
    end

    context "testing valid data" do
      before(:each) do
        Skill.document_skills ["test2", "test1", "test2"], ["22", "1", "2"], user
      end

      it "should test that the proper weights are assigned for test1" do
        user.skills.find_by_tag_id(Tag.find_by_name("test1")).weight.should == 1
      end

      it "should test that the proper weights are assigned for test2" do
        user.skills.find_by_tag_id(Tag.find_by_name("test2")).weight.should == 22
      end

      it "should test that duplicate tag names are ignored" do
        user.tags.where(name: "test2").count.should == 1
      end
    end
  end

end
