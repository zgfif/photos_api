# frozen_string_literal: true

class LocalStorage
  def initialize
    @image_ids = []
    @token = Token.retrieve['token']
  end

# runs caching the first page, all pages, stores images to db
  def reset
    cache_first_page
    cache_image_pages
    store_images_to_db if Picture.count == 0
  end

  private

  attr_reader :token, :image_ids

  def cache_first_page
    Rails.cache.fetch(url) { response(url) }
  end


  def cache_image_pages
    page_urls.each do |page_url|
      Rails.cache.fetch(page_url) do
        resp = response(page_url)
          resp[:body]['pictures'].each { |pic| @image_ids << pic['id']}
        resp
      end
    end
  end

  def store_images_to_db
    image_ids.each { |id| ImageCaching.new(id).perform }
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
