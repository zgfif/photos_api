# frozen_string_literal: true

class DropPicturesTable < ActiveRecord::Migration[6.1]
  def change
    drop_table :pictures
  end
end
