# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PageCaching do
  url = Rails.application.credentials.agile_url
  token = Token.retrieve['token']

  it 'should cache default page' do
    key = url + 'images'
    Rails.cache.delete(key)
    PageCaching.new(0, token).perform
    result = Rails.cache.read(key)
    expect(result[:body]['page']).to eq(1)
  end

  it 'should cache the first page' do
    key = "#{url}images?page=1"
    Rails.cache.delete(key)
    PageCaching.new(1, token).perform

    result = Rails.cache.read(key)
    expect(result[:body]['page']).to eq(1)
  end

  it 'should cache the 23th page' do
    key = "#{url}images?page=23"
    Rails.cache.delete(key)
    PageCaching.new(23, token).perform

    result = Rails.cache.read(key)
    expect(result[:body]['page']).to eq(23)
  end

  it 'should cache the 27th page' do
    key = "#{url}images?page=27"
    Rails.cache.delete(key)
    PageCaching.new(27, token).perform

    result = Rails.cache.read("#{url}images?page=27")
    expect(result[:body]['page']).to eq(27)
    expect(result[:body]['pictures']).to be_empty
    expect(result[:body]['hasMore']).to be_falsey
  end
end
