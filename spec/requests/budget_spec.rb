require 'rails_helper'

RSpec.describe Budget, type: :request do
    include Devise::Test::IntegrationHelpers
  before(:each) do
    @user = User.create(name: 'Isaac', email: 'kaplan@gmail.com', password: '123456', password_confirmation: '123456')
    @group = Group.create(name: 'Car', icon: 'www.stream.com', author_id: @user.id)
    @budget = Budget.create(name: 'clean', amount: 12, author_id: @user.id)
    @budget_group = BudgetGroup.create(group_id: @group.id, budget_id: @budget.id)


    sign_in @user
   end
 
   describe 'GET /budgets' do
    it 'return http success' do
        get user_group_budgets_path(@user, @group)
        expect(response).to have_http_status(200)
    end

    it 'render index page for transactions' do
        get user_group_budgets_path(@user, @group)
        expect(response.body).to include('Transaction')
    end
   end

   describe 'GET /budgets/new' do
    it 'return http success ' do
        get new_user_group_budget_path(@user, @group)
        expect(response).to have_http_status(200)
    end

    it 'render form to add transaction' do
        get new_user_group_budget_path(@user, @group)
        expect(response.body).to include('Create New Transaction')
        expect(response.body).to include('Sign out')
    end
   end

    
end