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

  describe 'Test for transactions page' do
    scenario 'should have group contents' do
      visit user_group_budgets_path(@user, @group)
      expect(page).to have_content(@group.name)
    end

    scenario 'should contain transaction name' do
      visit user_group_budgets_path(@user, @group)
      expect(page).to have_content(@budget.name)
    end

    scenario 'should contain transaction amount' do
      visit user_group_budgets_path(@user, @group)
      expect(page).to have_content(@budget.amount)
    end

    scenario 'should redirect to form for adding new transaction' do
      visit user_group_budgets_path(@user, @group)
      click_link 'Add New Transaction'
      expect(page).to have_button('Save')
    end

    scenario 'should contain form text in transaction form' do
      visit user_group_budgets_path(@user, @group)
      click_link 'Add New Transaction'
      expect(page).to have_content('Create New Transaction')
      expect(page).to have_content('Sign out')
    end
  end
end
