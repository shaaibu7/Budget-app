require 'rails_helper'

RSpec.describe Group, type: :request do
  before(:each) do
    @user = User.create(name: 'Isaac', email: 'kaplan@gmail.com', password: '123456', password_confirmation: '123456')
    @group = Group.create(name: 'Car', icon: 'www.stream.com', author_id: @user.id)
    @budget = Budget.create(name: 'clean', amount: 12, author_id: @user.id)
    @budget_group = BudgetGroup.create(group_id: @group.id, budget_id: @budget.id)
   end
 
    
   describe 'GET /' do

    it 'return http success' do
        get '/'
        expect(response).to have_http_status(200)
    end

    it 'displays sign in and sign up links on homepage' do
        get '/'
        expect(response.body).to include('Log in')
        expect(response.body).to include('Sign up')
    end
   end

   describe 'GET /sign in' do
    it 'return http success' do
        get new_user_session_path
        expect(response).to have_http_status(200)
    end

    it 'show log in form' do
        get new_user_session_path
        expect(response.body).to include('Log in')
    end
   end

   describe  'GET /sign up' do
    it 'return http success' do
        get new_user_registration_path
        expect(response).to have_http_status(200)
    end

    it 'should show sign up form' do
        get new_user_registration_path
        expect(response.body).to include('Sign up')
    end
   end

   describe 'GET /users/password/new' do
    it 'return http success' do
        get new_user_password_path
        expect(response).to have_http_status(200)
    end

    it 'should show forgot password form' do
        get new_user_password_path
        expect(response.body).to include('Forgot your password?')
    end

   end
    
end