# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Request do
  it 'should return response' do
    response = Request.new(url: 'some', headers: {}).get

    expect(response[:status]).to eq(400)
  end

  it 'should return POST response' do
    url = 'http://interview.agileengine.com/auth'
    payload = { "apiKey": '23567b218376f79d9415' }.to_json
    headers = { content_type: :json, accept: :json }

    response = Request.new(url: url, payload: payload, headers: headers).post

    expect(response[:body]).to include('token')
    expect(response[:status]).to eq(200)
  end
end
