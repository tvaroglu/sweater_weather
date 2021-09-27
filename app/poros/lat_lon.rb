class LatLon
  attr_reader :lat, :lon, :city_state

  def initialize(response_obj, city_state)
    @lat = response_obj[:latLng][:lat]
    @lon = response_obj[:latLng][:lng]
    @city_state = city_state
  end
end
