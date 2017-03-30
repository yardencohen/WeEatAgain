class Resturant < ApplicationRecord	
	belongs_to :cuisine
	validates :name, presence: true
	validates :cuisine_id, presence: true
	validates :rating, presence: true
	validates :address, presence: true
	validates :max_delivery_time, presence: true
end
