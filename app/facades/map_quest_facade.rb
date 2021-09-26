class MapQuestFacade
  class << self
    def get_lat_long(city_state)
      query = MapQuestService.get_lat_long(city_state)
      LatLong.new(query[:results].first[:locations].first, city_state) if query[:results]
    end
  end
end
