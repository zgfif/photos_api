# frozen_string_literal: true

class SearchPictures
  def initialize(value)
    @value = value
  end

  def search
    Picture.where('author LIKE ? OR camera LIKE ? OR image_id = ? OR tags LIKE ?',
                  "%#{value}%", "%#{value}%", value, "%#{value}%")
  end

  private

  attr_reader :value
end
