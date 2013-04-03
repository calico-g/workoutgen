require 'spec_helper'

feature 'Viewing list of exercises' do


	scenario 'can view list of exercises' do

	end
end







# require 'spec_helper'

# feature 'Creating Projects' do
# 	before do
# 		sign_in_as!(Factory(:admin_user))
# 		visit '/'
# 		click_link 'New Project'
# 	end

# 	scenario "can create a project" do
# 		fill_in 'Name', :with => "TextMate 2"
# 		fill_in 'Description', :with => "A text-editor for OS X"
# 		click_button 'Create Project'
# 		page.should have_content('Project has been created')
