# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TokenGeneration do
  describe 'retrieving token' do
    it 'should return token from external api' do
      token = TokenGeneration.new.get
      expect(token).to include('token')
    end
  end
end
