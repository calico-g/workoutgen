require 'spec_helper'

feature 'Editing an exercise' do
	ex = FactoryGirl.create(:ex)

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
