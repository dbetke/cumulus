require 'spec_helper'

describe 'home page' do
  it 'welcomes the user' do
    visit '/'
		page.status_code.should be 200
  end
end

describe 'full integration test', :js => true do
  it 'should save tags and weights' do
    visit '/'
		fill_in "tags_", :with => "My First Tag"
		page.find('.ui-slider-horizontal .ui-slider-handle')
		page.find('.add-word').click #clicks '+' (add new tag) button
		click_button "Save My Card"
		fill_in "user_name", :with => "My Full Name"
		fill_in "user_box1", :with => "Box One Information"
		fill_in "user_box2", :with => "Box Two Information"
		click_button "Save Back of Card"

		#verify tags are saved
    #page.should have_content("My First Tag")

		#verify Back of Card is saved
    page.should have_content("My Full Name")
    page.should have_content("Box One Information")
    page.should have_content("Box Two Information")
	
  end

end
