# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SearchResult do
  def params(term)
    ActionController::Parameters.new({ term: term }).permit(:term)
  end

  it 'should return images by author' do
    term = 'Victorious'
    result = SearchResult.new(params(term)).process

    expect(result[:pictures].count).to eq(1)
    expect(result[:pictures][0][:author]).to include(term)
  end

  it 'should NOT find any image by author' do
    term = 'invald'
    result = SearchResult.new(params(term)).process

    expect(result[:pictures].count).to eq(0)
  end
end
