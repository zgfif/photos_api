class Data
  def self.retrieve(url, token)
    Request.new(url: url, headers: headers(token)).get
  end

  private

  def self.headers(token)
    { Authorization: "Bearer #{token}" }
  end
end
