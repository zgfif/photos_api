# frozen_string_literal: true

# this class is used to handle images
class ImagesController < ApplicationController
  def index
    response = Page.new(image_params).process
    render json: { body: response[:body] }, status: response[:status]
  end

  def show
    response = Image.new(image_params).process
    render json: { body: response[:body] }, status: response[:status]
  end

  private

  def image_params
    params.permit(:page, :id)
  end
end
