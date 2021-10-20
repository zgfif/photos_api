# frozen_string_literal: true

class PageCaching
  @@image_ids = []

  def initialize(n, token)
    @n = n
    @token = token
  end

  def perform
    Rails.cache.write(url, query)
  end

  def self.image_ids
    @@image_ids
  end

  private

  attr_reader :n, :token, :response

  def query
    @response = Request.new(url: url, headers: header).get
    add_to_image_ids
    response
  end

  def header
    { Authorization: "Bearer #{token}" }
  end

  def url
    n.zero? ? agile_url : "#{agile_url}?page=#{n}"
  end

  def agile_url
    "#{Rails.application.credentials.agile_url}images"
  end

  def add_to_image_ids
    @@image_ids += ImageIds.new(response).extract
  end
end
