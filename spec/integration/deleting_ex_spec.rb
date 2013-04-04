require 'spec_helper'

feature 'Deleting an exercise' do
	ex = Factory(:ex)

	scenario 'can delete an exercise' do
		visit '/'
		click_link 'Exercises'
		click_link 'running'
		click_link 'delete'
		page.should have_content('Exercise deleted!')
	end
end
