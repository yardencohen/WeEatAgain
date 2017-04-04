class RemoveRatingFromResturants < ActiveRecord::Migration[5.0]
  def change
    remove_column :resturants, :rating, :integer
  end
end
