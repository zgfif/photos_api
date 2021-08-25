class Request
  def initialize
  end

  def get(url, headers)
      response = RestClient.get(url, headers)
      { status: response.code, body: JSON.parse(response.body) }
    rescue SocketError
      { status: 400 }
    rescue RestClient::Unauthorized
      { status: 401 }
  end
end