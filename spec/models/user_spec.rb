# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it 'should be valid without token' do
    user = User.new(email: 'example@mail.com')
    expect(user).to be_valid
  end

  it 'should NOT be valid without email' do
    user = User.new(token_expires: '12-03-2021')
    expect(user).to_not be_valid
  end

  it 'should NOT be valid with non unique email' do
    User.create(email: 'example@mail.com')
    user = User.new(email: 'example@mail.com', token_expires: '12-03-2021')
    expect(user).to_not be_valid
  end

  it 'should NOT be valid with non unique email' do
    User.create(email: 'example@mail.com')
    user = User.new(email: 'Example@mail.com', token_expires: '12-03-2021')
    expect(user).to_not be_valid
  end
end
