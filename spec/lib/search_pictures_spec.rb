# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SearchPictures do
  it 'should return picture attributes' do
    term = 'Pentax'
    result = SearchPictures.new(term).search
    expect(result.count).to eq(7)
  end

  it 'should not return any pictures' do
    term = 'nothing'
    result = SearchPictures.new(term).search
    expect(result.count).to eq(0)
  end
end
