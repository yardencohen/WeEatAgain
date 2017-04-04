class Cuisine < ApplicationRecord
	has_many :resturants

	validates_presence_of :title, :image
	validates_format_of :image, :with => /\.(jpg|png)\Z/i
	validates_uniqueness_of :title
	
end
