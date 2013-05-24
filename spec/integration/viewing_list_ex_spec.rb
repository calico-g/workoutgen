require 'spec_helper'
include Devise::TestHelpers

feature 'Viewing list of exercises' do
  # SHAMEFUL ADMISSION OF DEFEAT
  # I cannot get this before filter to work with database_cleaner

  # before(:each) do
  #   user_1 = FactoryGirl.create(:user)
  #   user_2 = FactoryGirl.create(:user)
  #   user_1.confirm!
  #   user_2.confirm!

  #   ex1 = FactoryGirl.create(:ex, :name => 'pooping', :user => user_1)
  #   ex2 = FactoryGirl.create(:ex, :name => 'jumping', :user => user_1)
  # end

  scenario "can view all exercises for a user in exercises view" do
    user_1 = FactoryGirl.create(:user)
    user_1.confirm!
    ex1 = FactoryGirl.create(:ex, :name => 'pooping', :user => user_1)
    sign_in_as!(user_1)
    visit '/'
    click_link "Exercises"
    page.should have_content("pooping")
    click_link "Sign out"
  end

  scenario "cannot view other user's exercises" do
    user_1 = FactoryGirl.create(:user)
    user_2 = FactoryGirl.create(:user)
    user_2.confirm!
    ex1 = FactoryGirl.create(:ex, :name => 'pooping', :user => user_1)
    ex2 = FactoryGirl.create(:ex, :name => 'jumping', :user => user_1)
    sign_in_as!(user_2)
    visit '/'
    click_link "Exercises"
    page.should_not have_content("pooping")
  end

end
