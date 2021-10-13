class Picture < ApplicationRecord
  validates :image_id, presence: true

  def decorate
    { id: image_id,
      camera: camera,
      author: author,
      cropped_picture: cropped_picture,
      full_picture: full_picture, tags: tags
    }
  end
end
