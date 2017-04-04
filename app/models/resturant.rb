class Resturant < ApplicationRecord	
	belongs_to :cuisine
	has_many :reviews

	validates_presence_of :name
	validates_inclusion_of :max_delivery_time, :in => 0...91

	def average_rating
		if self.reviews.size > 0
			self.reviews.average(:rating).round
		else
			0
		end
	end
end
