# frozen_string_literal: true

class RevertNotNullEmail < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :email, :string, null: true
  end
end
