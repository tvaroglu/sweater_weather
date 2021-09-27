class ThirdPartyFacade
  class << self
    def get_lat_lon(city_state)
      query = MapQuestService.get_lat_lon(city_state)
      LatLon.new(query[:results].first[:locations].first, city_state) if query[:results]
    end

    def get_forecast(lat, lon)
      query = OpenWeatherService.get_forecast(lat, lon)
      {
        current_weather: CurrentForecast.new(query[:current]),
        daily_weather: query[:daily][0..4].map { |response_obj| DailyForecast.new(response_obj) },
        hourly_weather: query[:hourly][0..7].map { |response_obj| HourlyForecast.new(response_obj) }
      }
    end
  end
end
