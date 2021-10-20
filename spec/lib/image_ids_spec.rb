# frozen_string_literal: true

RSpec.describe ImageIds do
  it 'should return ids from response' do
    response = { status: 200, body: { 'pictures' => [{ 'id' => '789' }, { 'id' => '456' }, { 'id' => '123' }] } }

    expect(ImageIds.new(response).extract).to eq(%w[789 456 123])
  end

  it 'should not return any ids' do
    response = { status: 404, body: { status: 'Not found' } }

    expect(ImageIds.new(response).extract).to eq([])
  end
end
