require 'spec_helper'

feature 'Viewing list of exercises' do
	ex1 = Factory(:ex, :name => 'pooping')
	ex2 = Factory(:ex, :name => 'jumping')
	ex3 = Factory(:ex, :name => 'swimming with sharks')
	ex4 = Factory(:ex, :name => 'running with big dogs')

	scenario 'can view list of exercises' do
		visit '/'
		click_link 'Exercises'
		page.should have_content 'pooping'
		page.should have_content 'jumping'
		page.should have_content 'swimming with sharks'
		page.should have_content 'running with big dogs'
	end
end
