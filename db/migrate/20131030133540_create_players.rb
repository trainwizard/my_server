class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :file_location
      t.text :description
      t.string :name
      t.boolean :downloadable
      t.boolean :playable
      t.references :user
      t.references :contest

      t.timestamps
    end
  end
end
