class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :Username
      t.string :Password
      t.string :Confirmation

      t.timestamps
    end
  end
end
