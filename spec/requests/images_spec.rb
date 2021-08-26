# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Images', type: :request do
  describe 'GET /index' do
    token = 'dea6a9d96ab451bd7e5fecc1579a42139972096f'

    headers = { 'Authorization' => "Bearer #{token}" }

    it 'returns http unauthorized' do
      get '/images'
      expect(response).to have_http_status(401)
    end

    it 'returns http ok' do
      get '/images', headers: headers
      expect(response).to have_http_status(:ok)
    end

    it 'returns the first page' do
      get '/images?page=1', headers: headers
      body = JSON.parse(response.body)
      expect(response).to have_http_status(:ok)
      expect(body['page']).to eq(1)
    end

    it 'returns the second page' do
      get '/images?page=2', headers: headers
      body = JSON.parse(response.body)
      expect(response).to have_http_status(:ok)
      expect(body['page']).to eq(2)
    end
  end
end
