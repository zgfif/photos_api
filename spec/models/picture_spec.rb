require 'rails_helper'

RSpec.describe Picture, type: :model do
  it 'should be valid without any fields' do
    expect(Picture.new).to be_valid
  end
end
