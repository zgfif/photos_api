require 'rails_helper'

RSpec.describe Token, type: :model do
  it 'should not empty' do
    expect(Token.count).to_not eq(0)
  end

  it 'should not be valid' do
    expect(Token.new).to_not be_valid
  end

  it 'should be valid' do
    expect(Token.new(value: 'random_value')).to be_valid
  end

  it 'should return recent token' do
    3.times do |n|
      Token.create(value: "token#{n}")
    end

    expect(Token.recent.value).to eq('token2')
  end
end
