require 'spec_helper'

feature 'Signing in' do

	scenario 'Signing in via confirmation' do
		FactoryGirl.create(:user, :email => 'confirm_me@example.com')

		open_email 'confirm_me@example.com', :with_subject => /Confirmation/
		click_first_link_in_email
		message = 'Your account was successfully confirmed'
		page.should have_content(message)
		page.should have_content('Signed in as confirm_me@example.com')
	end

	scenario 'Signing in via form' do
		FactoryGirl.create(:user, :email => 'user@example.com')

		User.find_by_email('user@example.com').confirm!
		visit '/'
		click_link 'Sign in'
		fill_in 'Email', :with => 'user@example.com'
		fill_in 'Password', :with => 'password'
		click_button 'Sign in'
		page.should have_content('Signed in successfully.')
	end
end
