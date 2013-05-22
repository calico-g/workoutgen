require "spec_helper"

feature 'Can generate a workout' do

	user_1 = FactoryGirl.create(:user, :id =>1)
	user_2 = FactoryGirl.create(:user, :id =>2)
	user_1.confirm!
	user_2.confirm!
	ex1 = FactoryGirl.create(:ex, :user => user_1, :name => 'running', :category => 'cardio')
	ex2 = FactoryGirl.create(:ex, :user => user_1, :name => 'push ups', :category => 'strength')
	ex3 = FactoryGirl.create(:ex, :user => user_1, :name => 'plies', :category => 'stretch')
	ex4 = FactoryGirl.create(:ex, :user => user_2, :name => 'pooping', :category => 'cardio')

	scenario 'generating a workout with only exercises for this user' do
		sign_in_as!(user_1)
		visit '/'
		click_link 'Generate Workout'
		fill_in 'Cardio', :with => '20'
		fill_in 'Strength', :with => '20'
		fill_in 'Stretch', :with => '20'
		click_button 'Generate'
		page.should have_content "Here is your workout. Enjoy!"
		page.should have_content 'running'
		page.should_not have_content 'pooping'
	end

	scenario 'generating workout with 0 cardio' do
		sign_in_as!(user_1)
		visit '/'
		click_link 'Generate Workout'
		fill_in 'Cardio', :with => '0'
		fill_in 'Strength', :with => '20'
		fill_in 'Stretch', :with => '20'
		click_button 'Generate'
		page.should have_content "Here is your workout. Enjoy!"
		page.should_not have_content 'running'
	end
end

