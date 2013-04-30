require 'spec_helper'
include Devise::TestHelpers

feature 'Editing an exercise' do

	before do
		ex = FactoryGirl.create(:ex)
		user = FactoryGirl.create(:user)
		user.confirm!
		sign_in_as!(user)
	end

	scenario 'can edit an exercise' do
		visit '/'
		click_link 'Exercises'
		click_link 'running'
		click_link 'edit'
		fill_in 'Name', :with => 'kick boxing'
		fill_in 'Description', :with => 'kicking a box'
		click_button 'Save'
		page.should have_content('Exercise updated!')
		page.should have_content('kick boxing')
	end
end
