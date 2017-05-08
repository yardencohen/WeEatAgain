require 'google_maps_service'

class GoogleDistanceMatrix
  def initialize
    @client = GoogleMapsService::Client.new(key: ENV['GOOGLE_API_KEY'])
  end

  def calc_distance(origin, destination)
    @client.distance_matrix(origin, destination, mode: 'walking', units: 'metric')
  end
end