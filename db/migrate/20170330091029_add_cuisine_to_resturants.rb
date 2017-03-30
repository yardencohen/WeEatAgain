class AddCuisineToResturants < ActiveRecord::Migration[5.0]
  def change
    add_reference :resturants, :cuisine, foreign_key: true
  end
end
