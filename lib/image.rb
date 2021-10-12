# frozen_string_literal: true

class Image
  def initialize(image_params)
    @image_params = image_params
  end

  def process
    if picture
      { body: picture.decorate, status: 200 }
    else
      { body: { status: 'Not found' }, status: 404 }
    end
  end

  private

  def picture
    @picture ||= Picture.find_by(image_id: image_id)
  end

  def image_id
    @image_params[:id]
  end
end
