# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SearchPictures do
  it 'should return picture attributes' do
    term = 'Pentax'
    result = SearchPictures.new(term).search
    expect(result.count).to eq(5)
  end

  it 'should not return any pictures' do
    term = 'nothing'
    result = SearchPictures.new(term).search
    expect(result.count).to eq(0)
  end

  it 'should return only one picture by id' do
    term = '58f45d1fff468c0848e2'
    result = SearchPictures.new(term).search

    expect(result.count).to eq(1)
  end
end
