class ImagesController < ApplicationController
  def index
    response = Request.new.get(agile_url, agile_header)

    render json: response[:body], status: response[:status]
  end

  private
  
  def agile_header
    { Authorization: "#{bearer}" }
  end

  def bearer
    "Bearer #{header_token}"
  end

  def agile_url
    'http://interview.agileengine.com/images'
  end

  def header_token
     request.headers['HTTP_AUTHORIZATION'].split[1] if request.headers.key?('HTTP_AUTHORIZATION')
  end
end
