require 'spec_helper'

feature 'Can refresh a workout' do

	scenario 'refreshing a workout' do

		user = FactoryGirl.create(:user)
		user.confirm!
		FactoryGirl.create(:ex, :user => user, :name => 'running', :category => 'cardio')
		FactoryGirl.create(:ex, :user => user, :name => 'push ups', :category => 'strength')
		FactoryGirl.create(:ex, :user => user, :name => 'plies', :category => 'stretch')

		visit '/'
		sign_in_as!(user)
		page.should have_content('Signed in successfully.')
		click_link 'Generate Workout'
		fill_in 'Cardio', :with => '20'
		fill_in 'Strength', :with => '20'
		fill_in 'Stretch', :with => '20'
		click_button 'Generate'
		page.should have_content "Here is your workout. Enjoy!"
		click_link 'Give me a new one.'
		page.should have_content "Here is your workout. Enjoy!"
	end

end
