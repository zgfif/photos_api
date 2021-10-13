# frozen_string_literal:true

class ImageCaching
  def initialize(id, token)
    @id = id
    @token = token
  end

  def perform
    picture.save ? true : false
  end

  private

  attr_reader :id, :token

  def picture
    Picture.new(image_id: details['id'], **details)
  end

  def details
    @details ||= Request.new(url: url, headers: header).get
    @details[:status] == 200 ? @details[:body] : {}
  end

  def url
    Rails.application.credentials.agile_url + 'images/' + id
  end

  def header
   { Authorization: "Bearer #{token}" }
  end
end
