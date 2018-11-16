require 'spec_helper'
require 'rails_helper'

feature 'the signup process' do
  background :each do 
    visit new_user_path
  end
  scenario 'has a new create account page' do 
    expect(page).to have_content('Create Account')
  end
  scenario 'has a email' do 
    expect(page).to have_content('Email')
  end
  scenario 'has a  password' do 
    expect(page).to have_content('Password')
  end

  feature 'signing up a user' do

    scenario 'shows username on the homepage after signup' do
      fill_in 'Email',with:'ted@email.com'
      fill_in 'Password',with:'password'
      click_button 'Create User'
      # save_and_open_page
      expect(page).to have_content("ted@email.com")
      user = User.find_by(email:"ted@email.com")
      expect(current_path).to eq(user_path(user))
    end

  end
end

feature 'logging in' do
  background :each do 
    visit new_session_path
  end
  scenario 'has a LogIn page' do 
    expect(page).to have_content('Log In')
  end
  scenario 'has a email' do 
    expect(page).to have_content('Email')
  end
  scenario 'has a  password' do 
    expect(page).to have_content('Password')
  end

end

feature 'logging out' do
  background :each do 
    visit new_session_path
  end
  scenario 'begins with a logged out state' do
    
  end

  scenario 'doesn\'t show username on the homepage after logout'

end