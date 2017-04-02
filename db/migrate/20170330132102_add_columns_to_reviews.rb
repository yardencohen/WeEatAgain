class AddColumnsToReviews < ActiveRecord::Migration[5.0]
  def change
    add_column :reviews, :rating, :integer
    add_column :reviews, :reviewer, :string
    add_column :reviews, :description, :text
  end
end
