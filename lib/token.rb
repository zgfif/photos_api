# frozen_string_literal: true

# used to generate token
class Token
  def get
    response = Request.new(url: url, payload: payload, headers: header).post
    response[:body]
  end

  def url
    Rails.application.credentials.agile_url
  end

  private

  def payload
    { 'apiKey': Rails.application.credentials.api_key }.to_json
  end

  def header
    { content_type: :json, accept: :json }
  end
end
