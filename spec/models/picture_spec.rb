require 'rails_helper'

RSpec.describe Picture, type: :model do
  it 'should not be valid without image_id' do
    expect(Picture.new).to_not be_valid
  end
end
