class RemoveGenreFromResturants < ActiveRecord::Migration[5.0]
  def change
    remove_column :resturants, :genre, :string
  end
end
