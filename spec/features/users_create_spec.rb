# require 'rails_helper'
#
# describe 'the user creation process with google', type: :feature do
#
#   before(:each) do
#     visit new_user_path
#   end
#
#   it 'creates a user using a username and password' do
#     expect(page).to have_content('Create New User')
#
#     expect(page).to have_content('User Name')
#     page.fill_in 'User name', :with => 'aceman21'
#
#     expect(page).to have_content('Email')
#     page.fill_in 'Email', :with => 'cminnerath@gmail.com'
#
#     click_link_or_button 'Create User with Google'
#
#     expect(page).to have_content('Welcome, aceman21')
#     expect(page).to have_content('Create A Mini')
#     expect(page).to have_content('View Minis')
#     expect(page).to have_content('Logout')
#   end
# end
