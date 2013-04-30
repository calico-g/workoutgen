require 'spec_helper'

feature 'Deleting an exercise' do

	before do
		user = FactoryGirl.create(:user)
		user.confirm!
		sign_in_as!(user)
		ex = FactoryGirl.create(:ex, :user => user)
	end

	scenario 'can delete an exercise' do
		visit '/'
		click_link 'Exercises'
		click_link 'running'
		click_link 'delete'
		page.should have_content('Exercise deleted!')
	end
end
