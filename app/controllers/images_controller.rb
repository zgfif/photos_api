# frozen_string_literal: true

# this class is used to handle images
class ImagesController < ApplicationController
  def index
    response = Request.new(url: agile_url, headers: agile_header).get
    render json: response[:body], status: response[:status]
  end

  def show
    url = "#{agile_url}#{image_params[:params]['id']}"
    response = Request.new(url: url, headers: agile_header).get
    render json: response[:body], status: response[:status]
  end

  private

  def image_params
    { params: params.permit(:page, :id).to_hash }
  end

  def agile_header
    { Authorization: "Bearer #{header_token}" }.merge(image_params)
  end

  def agile_url
    'http://interview.agileengine.com/images/'
  end

  def header_token
    request.headers['HTTP_AUTHORIZATION'].split[1] if request.headers.key?('HTTP_AUTHORIZATION')
  end
end
