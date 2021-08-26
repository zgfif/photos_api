# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Request do
  rq = Request.new

  it 'should return response' do
    url = 'some'
    headers = {}
    response = rq.get(url, headers)

    expect(response[:status]).to eq(400)
  end
end
