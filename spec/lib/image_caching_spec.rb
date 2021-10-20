# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ImageCaching do
  def token
    Token.retrieve['token']
  end

  it 'should cache image by id' do
    id = '07a455ec1c6591d714e5'
    Picture.where(image_id: id).destroy_all
    expect(Picture.find_by(image_id: id)).to be_nil

    result = ImageCaching.new(id, token).perform
    pic = Picture.find_by(image_id: id)
    expect(result).to be_truthy
    expect(pic).to_not be_nil
  end

  it 'should NOT cache image by id' do
    id = 'some_invalid_id'

    result = ImageCaching.new(id, token).perform
    expect(result).to be_falsey
  end
end
