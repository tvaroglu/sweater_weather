class MapQuestFacade
  class << self
    def get_lat_long(city_state)
      query = MapQuestService.get_lat_long(city_state)
      if query[:results]
        LatLong.new(query[:results].first[:locations].first, city_state)
      end
    end
  end
end
