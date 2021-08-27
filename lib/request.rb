# frozen_string_literal: true

# used to perform external request
class Request
  def get(url, headers)
    response = RestClient.get(url, headers)
    { status: response.code, body: hash(response.body) }
  rescue SocketError
    { status: 400 }
  rescue RestClient::Unauthorized
    { status: 401 }
  rescue RestClient::NotFound
    { status: 404 }
  end

  private

  def hash(json)
    JSON.parse(json)
  end
end
