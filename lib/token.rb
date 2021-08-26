# frozen_string_literal: true

# used to generate token
class Token
  def retrieve
    response = RestClient.post(url, payload, header)
    JSON.parse(response.body)
  end

  private

  def url
    Rails.application.credentials.agile_url
  end

  def payload
    { 'apiKey': Rails.application.credentials.api_key }.to_json
  end

  def header
    { content_type: :json, accept: :json }
  end
end
