require 'rails_helper'

RSpec.describe Group, type: :model do
  before(:each) do
    @user = User.create(name: 'Isaac', email: 'kaplan@gmail.com', password: '123456', password_confirmation: '123456')
    @group = Group.create(name: 'Car', icon: 'www.stream.com', author_id: @user.id)
  end

  it 'should create a valid group for user' do
    expect(@group).to be_valid
  end

  it 'should not be valid without name' do
    @group.name = nil
    expect(@group).to_not be_valid
  end

  it 'should not be valid without icon url' do
    @group.icon = nil
    expect(@group).to_not be_valid
  end
end
