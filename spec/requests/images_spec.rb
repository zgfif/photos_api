# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Images', type: :request do
  describe 'GET /index' do
    it 'returns the first page without number' do
      get '/images', headers: headers
      body = JSON.parse(response.body)

      expect(body['body']['page']).to eq(1)
      expect(response).to have_http_status(:ok)
    end

    it 'returns the first page' do
      get '/images?page=1'
      body = JSON.parse(response.body)

      expect(body['body']['page']).to eq(1)
      expect(response).to have_http_status(:ok)
    end

    it 'returns the second page' do
      get '/images?page=2'
      body = JSON.parse(response.body)

      expect(body['body']['page']).to eq(2)
      expect(response).to have_http_status(:ok)
    end

    it 'returns the empty array of pictures' do
      get '/images?page=888'
      body = JSON.parse(response.body)

      expect(body['body']['page']).to eq('888')
      expect(body['body']['hasMore']).to be_falsy
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /show' do
    it 'returns no content' do
      get '/images/123', headers: headers
      body = JSON.parse(response.body)

      expect(body['body']['status']).to eq('Not found')
      expect(response).to have_http_status(:not_found)
    end

    it 'returns image details' do
      pic = Picture.create(image_id: '1w23')
      get "/images/#{pic.image_id}"
      body = JSON.parse(response.body)

      expect(body['body']['id']).to eq(pic.image_id)
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /search' do
    it 'should return no content' do
      get '/search/irrelevant_value'
      body = JSON.parse(response.body)
      expect(body['pictures']).to be_empty
    end

    it 'should return one picture with value' do
      get '/search/Firm'
      body = JSON.parse(response.body)

      expect(body['pictures']).to be_present
      expect(body['pictures'][0]['id']).to eq('ec03a7808b9feb8b66c6')
    end
  end
end
