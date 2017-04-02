class Resturant < ApplicationRecord	
	belongs_to :cuisine
	has_many :reviews
	validates :name, presence: true
	validates :cuisine_id, presence: true
	validates :rating, presence: true
	validates :address, presence: true
	validates :max_delivery_time, presence: true

	def average_rating
		if self.reviews.size > 0
			self.reviews.average(:rating).round
		else
			0
		end
	end
end
