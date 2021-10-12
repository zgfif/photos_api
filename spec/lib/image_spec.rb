# frozen_string_literal: true

RSpec.describe Image do
  def params(id)
    ActionController::Parameters.new({ id: id }).permit(:id)
  end

  it 'should return image details' do
    id = '2cd3a648c7166bdf14a3'
    result = Image.new(params(id)).process

    expect(result[:body][:id]).to eq(id)
    expect(result[:status]).to eq(200)
  end

  it 'should not return image details' do
   result = Image.new(params('456')).process

   expect(result[:body][:status]).to eq('Not found')
   expect(result[:status]).to eq(404)
  end
end
