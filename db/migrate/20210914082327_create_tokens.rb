class CreateTokens < ActiveRecord::Migration[6.1]
  def change
    create_table :tokens, id: :uuid do |t|
      t.string :value

      t.timestamps
    end
  end
end
