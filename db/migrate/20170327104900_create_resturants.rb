class CreateResturants < ActiveRecord::Migration[5.0]
  def change
    create_table :resturants do |t|
      t.string :name
      t.string :genre
      t.integer :rating
      t.boolean :tenbis
      t.text :address
      t.datetime :max_delivery_time

      t.timestamps
    end
  end
end
