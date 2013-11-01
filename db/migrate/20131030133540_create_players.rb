class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :file_location
      t.text :description
      t.string :name
      t.bool :downloadable
      t.bool :playable
      t.reference :user
      t.reference :contest

      t.timestamps
    end
  end
end
