# frozen_string_literal: true

class LocalStorage
  def initialize
    @token = Token.retrieve['token']
  end

  def reset
    cache_picture_pages
    cache_images if Picture.count.zero?
  end

  private

  attr_reader :token

  def cache_picture_pages
    (0..26).each do |n|
      PageCaching.new(n, token).perform
    end
  end

  def cache_images
    image_ids.each { |id| ImageCaching.new(id, token).perform }
  end

  def image_ids
    PageCaching.image_ids
  end

  def clear_pictures
    Picture.destroy_all
  end
end
