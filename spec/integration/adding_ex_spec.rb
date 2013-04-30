require 'spec_helper'

feature 'Can add an exercise' do

	before do
		user = FactoryGirl.create(:user, :email => 'hello@example.com')
		user.confirm!
		sign_in_as!(user)
	end

	scenario 'adding an exercise' do
		visit '/'
		click_link 'Exercises'
		click_link "Add exercise"
		fill_in 'Name', :with => "running"
		fill_in 'Description', :with => "putting one foot in front of the other"
		choose "cardio"
		attach_file "You can upload a photo if you'd like.", "spec/fixtures/kitty.jpg"
		fill_in "url", :with => "http://en.wikipedia.org/wiki/Running"
		click_button "Save"
		page.should have_content "Exercise added to list."
		page.should have_content "running"
	end
end
