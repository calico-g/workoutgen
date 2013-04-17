require "spec_helper"

feature 'Can generate a workout' do

	scenario 'generating a workout' do
		visit '/'
		click_link 'Generate Workout'
		fill_in 'Total', :with => '60'
		fill_in 'Cardio', :with => '20'
		fill_in 'Strength', :with => '20'
		fill_in 'Stretch', :with => '20'
		click_button 'Generate'
		page.should have_content "Here's your workout. Enjoy!"
		page.should have_content 'running'
		#next write some more details for this test
	end
end

