# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SearchResult do
  it 'should return images by author' do
    term = 'Victorious'
    params = ActionController::Parameters.new({ term: term }).permit(:term)

    result = SearchResult.new(params).process

    expect(result[:pictures].count).to eq(1)
    expect(result[:pictures][0][:author]).to include(term)
  end

  it 'should NOT find any image by author' do
    term = 'invald'
    params = ActionController::Parameters.new({ term: term }).permit(:term)

    result = SearchResult.new(params).process

    expect(result[:pictures].count).to eq(0)
  end
end
