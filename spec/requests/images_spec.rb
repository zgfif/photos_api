# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Images', type: :request do
  token = '7ba9fd3bf0f583b6e23366a6369601ef7f2e1440'
  headers = { 'Authorization' => "Bearer #{token}" }

  describe 'GET /index' do
    it 'returns http unauthorized' do
      get '/images'
      expect(JSON.parse(response.body)).to be_nil
      expect(response).to have_http_status(:unauthorized)
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
    it 'returns the image by id' do
       get '/images/ec03a7808b9feb8b66c6', headers: headers
       body = JSON.parse(response.body)
       expect(response).to have_http_status(:ok)
       expect(body).to include('cropped_picture')
       expect(body).to include('camera')
       expect(body).to include('tags')
    end

    it 'should NOT return the image by id' do
      get '/images/invalid_id', headers: headers
      expect(JSON.parse(response.body)).to be_nil
      expect(response).to have_http_status(:not_found)
    end
  end
end
