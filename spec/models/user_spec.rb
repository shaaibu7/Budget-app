require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.create(name: 'Isaac', email: 'kaplan@gmail.com', password: '123456', password_confirmation: '123456')
  end

  it 'should create a valid group for user' do
    expect(@user).to be_valid
  end

  it 'should not be a valid user' do
    @user.name = nil
    expect(@user).to_not be_valid
  end
end
