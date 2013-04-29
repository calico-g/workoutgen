require 'spec_helper'

feature 'Viewing an exercise' do
		ex = FactoryGirl.create(:ex)

	scenario 'can view an exercise' do
		visit '/'
		click_link 'Exercises'
		click_link 'running'
		page.should have_content("running")
		page.should have_content('putting one foot in front of the other, briskly')
		page.should have_content("cardio")
	end
end
