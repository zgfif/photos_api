# frozen_string_literal: true

# this class is used to search images by their attributes
class SearchResult
  def initialize(image_params)
    @image_params = image_params
  end

  def process
    { pictures: pictures }
  end

  private

  def pictures
    @pictures = SearchPictures.new(term).search

    @pictures.present? ? decorate_pictures : []
  end

  def decorate_pictures
    @pictures.map(&:decorate)
  end

  def term
    @image_params['term']
  end
end
