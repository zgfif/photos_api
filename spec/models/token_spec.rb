require 'rails_helper'

RSpec.describe Token do
  describe 'retrieving token' do
    it 'should return token from external api' do
      token = Token.new.retrieve
      expect(token).to include('token')
    end
  end
end
