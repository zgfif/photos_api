class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users, id: :uuid do |t|
      t.string :email, unique: true
      t.string :token
      t.datetime :token_expires

      t.timestamps
    end
  end
end
