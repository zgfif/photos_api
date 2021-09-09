# frozen_string_literal: true

# used to perform external request
class Request
  attr_reader :url

  def initialize(**args)
    @url = args[:url]
    @headers = args[:headers]
    @payload = args[:payload]
  end

  def get
    response = RestClient.get(url, headers)
    { status: response.code, body: hash(response.body) }
  rescue SocketError
    { status: 400 }
  rescue RestClient::Unauthorized
    { status: 401 }
  rescue RestClient::NotFound
    { status: 404, body: { status: 'Not found' } }
  end

  def post
    response = RestClient.post(url, payload, headers)
    { status: response.code, body: hash(response.body) }
  end

  private

  attr_reader :headers, :payload

  def hash(json)
    JSON.parse(json)
  end
end
