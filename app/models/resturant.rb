class Resturant < ApplicationRecord	
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
