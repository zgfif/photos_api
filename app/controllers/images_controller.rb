# frozen_string_literal: true

# this class is used to handle images
class ImagesController < ApplicationController
  def index
    response = Request.new.get(agile_url, agile_header)
    render json: response[:body], status: response[:status]
  end

  private

  def image_params
    { params: params.permit(:page).to_hash }
  end

  def agile_header
    { Authorization: "Bearer #{header_token}" }.merge(image_params)
  end

  def agile_url
    'http://interview.agileengine.com/images'
  end

  def header_token
    request.headers['HTTP_AUTHORIZATION'].split[1] if request.headers.key?('HTTP_AUTHORIZATION')
  end
end
