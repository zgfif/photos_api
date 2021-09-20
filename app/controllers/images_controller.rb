# frozen_string_literal: true

# this class is used to handle images
class ImagesController < ApplicationController
  def index
    if !image_params['page'] || (image_params['page'] && (1..26).include?(image_params['page'].to_i))
      response = Rails.cache.read(url)
      render json: { body: response[:body] }, status: response[:status]
    else
      render json: { body: invalid_page(image_params['page']) }
    end
  end

  def show
    render json: picture
  rescue
    render json: invalid_id, status: 404
  end

  private

  def invalid_id
    { status: 'Not found' }
  end

  def picture
    @picture ||= Picture.find(image_params[:'id'])
  end

  def url
    Rails.application.credentials.agile_url + 'images' + request_params
  end

  def image_params
    params.permit(:page, :id)
  end

  def request_params
    image_params['page'] ? "?page=#{image_params['page']}" : ''
  end

  def invalid_page(n)
    { pictures: [], page: n, pageCount: 26, hasMore: false }
  end
end
