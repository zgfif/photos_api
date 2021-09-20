# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Images', type: :request do
  describe 'GET /index' do
    it 'returns http ok' do
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
      expect(body['status']).to eq('Not found')
      expect(response).to have_http_status(:not_found)
    end

    it 'returns image details' do
      pic = Picture.create

      get "/images/#{pic.id}"
      body = JSON.parse(response.body)
      expect(body['id']).to eq(pic.id)
      expect(response).to have_http_status(:ok)
    end
  end
end
