require 'rails_helper'

RSpec.describe Picture, type: :model do
  it 'should not be valid without image_id' do
    expect(Picture.new).to_not be_valid
  end

  it 'should be valid with image_id' do
    expect(Picture.new(image_id: '13131')).to be_valid
  end

  it 'should decorate picture' do
    attrs = { image_id: '123', author: 'Van Gog', camera: 'IMX 682', cropped_picture: 'img/cropped', full_picture: 'img/full_pic', tags: '#some#tags' }
    pic = Picture.new(attrs)
    expect(pic).to be_valid
    expect(pic.decorate).to include(id: attrs[:image_id], camera: attrs[:camera], cropped_picture: attrs[:cropped_picture], full_picture: attrs[:full_picture], tags: attrs[:tags])
  end
end
