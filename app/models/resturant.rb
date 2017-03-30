class Resturant < ApplicationRecord	
	validates :name, presence: true
	validates :genre, presence: true
	validates :rating, presence: true
	validates :address, presence: true
	validates :max_delivery_time, presence: true

	def get_cuisine_icon
		cuisine = Cuisine.find_by(title: self.genre)
		if cuisine
		  image = cuisine.image
		else
		  image = Cuisine.find_by(title: 'Other').image
		end

		image
	end
end
