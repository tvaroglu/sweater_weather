class LatLong
  attr_reader :lat, :long, :city_state

  def initialize(response_obj, city_state)
    @lat = response_obj[:latLng][:lat]
    @long = response_obj[:latLng][:lng]
    @city_state = city_state
  end
end
