class Review < ApplicationRecord
  belongs_to :resturant
  validates_numericality_of :rating, :only_integer => true
  validates :rating, :inclusion => 0..4
end
