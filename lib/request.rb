# frozen_string_literal: true

# used to perform external requests
class Request
  def initialize(**args)
    @url =     args[:url]
    @headers = args[:headers]
    @payload = args[:payload]
    @status = 200
    @body = nil
  end

  def get
    begin
      response = RestClient.get(url, headers)
      @status, @body = response.code, to_hash(response.body)

    rescue SocketError
       @status = 400
    rescue RestClient::Unauthorized
       @status = 401
    rescue RestClient::NotFound
      @status, @body = 404, { status: 'Not found' }
    end

    result

  end

  def post
    response = RestClient.post(url, payload, headers)
    @status, @body = response.code, to_hash(response.body)

    result
  end

  private

  attr_reader :headers, :payload, :url

  def result
    { status: @status, body: @body }
  end

  def to_hash(json)
    JSON.parse(json)
  end
end
