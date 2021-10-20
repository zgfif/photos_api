# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Page do
  def params(args = {})
    ActionController::Parameters.new(**args).permit(:page)
  end

  it 'should return the 2th page' do
    page = 22
    response = Page.new(params(page: page)).process
    expect(response[:body]).to include('page' => page)
  end

  it 'should return the first page' do
    page = 1
    response = Page.new(params(page: page)).process
    expect(response[:body]).to include('page' => page)
  end

  it 'should also return the first page when no page number' do
    response = Page.new(params).process
    expect(response[:body]).to include('page' => 1)
  end

  it 'should return an empty list of pictures' do
    page = 27
    response = Page.new(params(page: page)).process
    expect(response[:body]).to include({ page: page.to_s, hasMore: false, pictures: [] })
  end
end
