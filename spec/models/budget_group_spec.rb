require 'rails_helper'

RSpec.describe Group, type: :model do
  before(:each) do
    @user = User.create(name: 'Isaac', email: 'kaplan@gmail.com', password: '123456', password_confirmation: '123456')
    @group = Group.create(name: 'Car', icon: 'www.stream.com', author_id: @user.id)
    @budget = Budget.create(name: 'clean', amount: 12, author_id: @user.id)
    @budget_group = BudgetGroup.create(group_id: @group.id, budget_id: @budget.id)
  end

  it 'should create a valid budget group' do
    expect(@budget_group).to be_valid
  end
end
