require 'rails_helper'

RSpec.describe User, type: :model do
  it 'creates a valid user' do
    user = build :user
    expect(user).to be_valid
  end

  it 'requires an email' do
    user = build :user, email: ''
    expect(user).to be_invalid
  end
end
