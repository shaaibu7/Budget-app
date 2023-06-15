require 'rails_helper'

RSpec.describe Group, type: :request do
  include Devise::Test::IntegrationHelpers
  before(:each) do
    @user = User.create(name: 'Isaac', email: 'kaplan@gmail.com', password: '123456',
                        password_confirmation: '123456')
    @group = Group.create(name: 'Car', icon: 'www.stream.com', author_id: @user.id)
    @budget = Budget.create(name: 'clean', amount: 12, author_id: @user.id)
    @budget_group = BudgetGroup.create(group_id: @group.id, budget_id: @budget.id)

    sign_in @user
  end

  describe 'GET /group' do
    it 'return http success' do
      get user_groups_path(@user)
      expect(response).to have_http_status(200)
    end

    it 'render index page groups' do
      get user_groups_path(@user)
      expect(response.body).to include('Categories')
    end
  end

  describe 'GET /group/new' do
    it 'return http success ' do
      get new_user_group_path(@user)
      expect(response).to have_http_status(200)
    end

    it 'render form to add group' do
      get new_user_group_path(@user)
      expect(response.body).to include('CREATE CATEGORY')
      expect(response.body).to include('Sign out')
    end
  end
end
