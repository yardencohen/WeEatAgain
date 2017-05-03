

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

  def calc_distance(user_location)
    origin = {lat: user_location[:coords][:latitude].to_f,
             lng: user_location[:coords][:longitude].to_f}
    res = GoogleDistanceMatrix.new.calc_distance(origin, self.address)
    res
  end
end
