require 'rails_helper'

RSpec.describe Group, type: :feature do
  before(:each) do
    @user = User.create(name: 'Isaac', email: 'kaplan@gmail.com', password: '123456', password_confirmation: '123456')
    @group = Group.create(name: 'Car', icon: 'www.stream.com', author_id: @user.id)
    @budget = Budget.create(name: 'clean', amount: 12, author_id: @user.id)
    @budget_group = BudgetGroup.create(group_id: @group.id, budget_id: @budget.id)

    visit new_user_session_path
    fill_in 'user_email', with: @user.email
    fill_in 'user_password', with: @user.password
    click_button 'Log in'
  end

  describe 'Test for group page' do
    scenario 'should have contents for group' do
      visit user_groups_path(@user)
      expect(page).to have_content('Add New Category')
    end

    scenario 'should show name of group' do
      visit user_groups_path(@user)
      expect(page).to have_content('Car')
    end

    scenario 'should display sum of transactions' do
      visit user_groups_path(@user)
      expect(page).to have_content(@budget.amount)
    end

    scenario 'should redirect to page for adding new category' do
      visit user_groups_path(@user)
      click_link 'Add New Category'
      expect(page).to have_content('Create Category')
    end
  end
end
