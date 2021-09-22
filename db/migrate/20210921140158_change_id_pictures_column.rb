class ChangeIdPicturesColumn < ActiveRecord::Migration[6.1]
  def change
    change_column_default(:pictures, :id, nil)
  end
end
