# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Images', type: :request do
  token = '508c87e22d9d6b01c1d6cbc81b0daaf5edbd7183'
  headers = { 'Authorization' => "Bearer #{token}" }

  describe 'GET /index' do
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

  describe 'GET /show' do
    it 'returns unauthorized' do
      get '/images/123'
      expect(response).to have_http_status(401)
    end

    it 'returns no content' do
      get '/images/123', headers: headers
      body = JSON.parse(response.body)
      # p body
      expect(body['status']).to eq('Not found')
      expect(response).to have_http_status(404)
    end

    it 'returns image details' do
      get '/images/ec03a7808b9feb8b66c6', headers: headers
      body = JSON.parse(response.body)
      # p body
      expect(body['id']).to eq('ec03a7808b9feb8b66c6')
      expect(response).to have_http_status(200)
    end
  end
end
