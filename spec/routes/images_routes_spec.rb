# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'routes for images', type: :routing do
  it 'routes to images controller index action' do
    expect(get('/images')).to route_to('images#index')
    expect(get('/images?page=1')).to route_to(controller: 'images', action: 'index', page: '1')
    expect(get('/images?page=2')).to route_to(controller: 'images', action: 'index', page: '2')
  end

  it 'routes for images show action' do
    expect(get('/images/123')).to route_to(controller: 'images', action: 'show', id: '123')
  end

  it 'routes for images search action' do
    expect(get('/search/searchTerm')).to route_to(controller: 'images', action: 'search', term: 'searchTerm')
  end
end
