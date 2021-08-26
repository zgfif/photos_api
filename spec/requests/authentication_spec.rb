# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Authentications', type: :request do
  describe 'POST /auth' do
    let(:api_key) { Rails.application.credentials.api_key }

    it 'should respond with forbidden status' do
      post '/auth'
      expect(response.status).to eq(403)
    end

    it 'should respond with stored user token' do
      user = User.create(email: 'mail@example.com', token: '1234', token_expires: Time.now + 1.day)
      params = { 'apiKey': api_key, user_id: user.id }
      post '/auth', params: params

      expect(response.status).to eq(201)
      expect(JSON.parse(response.body)['token']).to eq('1234')
    end

    it 'should respond with new user token' do
      user = User.create(email: 'mail@example.com', token: '1234', token_expires: Time.now - 1.day)
      params = { 'apiKey': api_key, user_id: user.id }
      post '/auth', params: params

      expect(response.status).to eq(201)
      expect(JSON.parse(response.body)['token']).to_not eq('1234')
    end

    it 'should respond with new user token if no token' do
      user = User.create(email: 'mail@example.com', token_expires: Time.now - 1.day)
      params = { 'apiKey': api_key, user_id: user.id }
      post '/auth', params: params

      expect(response.status).to eq(201)
      expect(JSON.parse(response.body)['token']).to_not eq(nil)
    end
  end
end
