class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.belongs_to :resturant, foreign_key: true

      t.timestamps
    end
  end
end
