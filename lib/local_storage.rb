# frozen_string_literal: true

class LocalStorage
  def initialize
    @token = TokenGeneration.new.get['token']
  end

  def reset
    cache_first_page
    cache_image_pages
  end

  private

  attr_reader :token

  def cache_first_page
    Rails.cache.fetch(url) { response(url) }
  end

  def cache_image_pages
    page_urls.each do |page_url|
      Rails.cache.fetch(page_url) { response(page_url) }
    end
  end

  def page_urls
    list = []
    (1..26).each { |n| list << "#{url}?page=#{n}" }
    list
  end

  def response(url)
    Request.new(url: url, headers: header).get
  end

  def url
    Rails.application.credentials.agile_url + 'images'
  end

  def header
    { Authorization: "Bearer #{token}" }
  end
end
