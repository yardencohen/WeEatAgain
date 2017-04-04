class Review < ApplicationRecord
  belongs_to :resturant
  validates_numericality_of :rating, :only_integer => true
  validates_inclusion_of :rating, in: 0...4
  validates_presence_of :rating, :reviewer
end
