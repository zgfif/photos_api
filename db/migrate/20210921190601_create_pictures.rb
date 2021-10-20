# frozen_string_literal: true

class CreatePictures < ActiveRecord::Migration[6.1]
  def change
    create_table :pictures, id: :uuid do |t|
      t.string :image_id
      t.string :author
      t.string :camera
      t.string :tags
      t.string :cropped_picture
      t.string :full_picture

      t.timestamps
    end
  end
end
