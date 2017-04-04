class AddotNulllConstraintsForTables < ActiveRecord::Migration[5.0]
  def change
    change_column :resturants, :name, :string, null: false
    change_column :resturants, :cuisine_id, :integer, null: false
    change_column :cuisines, :title, :string, null: false
    change_column :cuisines, :image, :string, null: false
    change_column :reviews, :rating, :integer, null: false
    change_column :reviews, :reviewer, :string, null: false
    change_column :reviews, :resturant_id, :integer, null: false
  end
end
