require 'rails_helper'

RSpec.describe User, type: :feature do
  before(:each) do
    @user = User.create(name: 'Isaac', email: 'kaplan@gmail.com', password: '123456', password_confirmation: '123456')
  end

  describe 'sign in page' do
    scenario 'should have sign in page' do
      visit new_user_session_path
      expect(page).to have_content('Log in')
      expect(page).to have_content('Sign up')
      expect(page).to have_content('Forgot your password')
    end

    scenario 'Sign up link should redirect to sign up page' do
      visit new_user_session_path
      click_link 'Sign up'
      expect(page).to have_content('Sign up')
    end

    scenario 'Forgot your password link should link to confirmation form' do
      visit new_user_session_path
      click_link 'Forgot your password'
      expect(page).to have_content('Forgot your password?')
      expect(page).to have_button('Send me reset password instructions')
      expect(page).to have_content('Log in')
      expect(page).to have_content('Sign up')
    end
  end

  describe 'sign up page' do
    scenario 'should have sign up page' do
      visit new_user_registration_path
      expect(page).to have_content('Sign up')
    end
  end
end
