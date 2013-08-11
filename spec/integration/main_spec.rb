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
		page.find('.ui-slider-horizontal .ui-slider-handle').drag_by(30, 0)
		page.find('.add-word').click #clicks '+' (add new tag) button
		click_button "Save My Card"
		fill_in "user_name", :with => "My Full Name"
		fill_in "user_box1", :with => "Box One Information"
		fill_in "user_box2", :with => "Box Two Information"
		click_button "Save Back of Card"

		#verify tags/weights/front of card are saved
    page.should have_content("my first tag")
    page.should have_content("20") #moved tag by 30 in line 14, so weight is set to 30

		#verify Back of Card is saved
    page.should have_content("My Full Name")
    page.should have_content("Box One Information")
    page.should have_content("Box Two Information")
	
  end

end

#added this to move ui-slider bar
#see http://stackoverflow.com/questions/10866960/how-do-i-drag-a-jquery-slider-handle-from-within-capybara-and-chromedriver
module CapybaraExtension
  def drag_by(right_by, down_by)
    base.drag_by(right_by, down_by)
  end
end

module CapybaraSeleniumExtension
  def drag_by(right_by, down_by)
    driver.browser.action.drag_and_drop_by(native, right_by, down_by).perform
  end
end

::Capybara::Selenium::Node.send :include, CapybaraSeleniumExtension
::Capybara::Node::Element.send :include, CapybaraExtension
