class ThirdPartyFacade
  class << self
    def get_lat_lon(city_state)
      query = MapQuestService.get_lat_lon(city_state)
      LatLon.new(query[:results].first[:locations].first, city_state) if query[:results]
    end

    def get_route(from, to)
      query = MapQuestService.get_route(from, to)
      Route.new(query[:route], from, to) if query[:route][:formattedTime].present?
    end

    def get_forecast(lat, lon)
      query = OpenWeatherService.get_forecast(lat, lon)
      {
        current_weather: CurrentForecast.new(query[:current]),
        daily_weather: query[:daily][0..4].map { |response_obj| DailyForecast.new(response_obj) },
        hourly_weather: query[:hourly][0..7].map { |response_obj| HourlyForecast.new(response_obj) }
      }
    end

    def get_books(location, quantity)
      query = OpenLibraryService.get_books(location)
      {
        destination: location,
        total_books_found: query[:numFound],
        books: query[:docs][0..quantity.to_i - 1].map { |response_obj| Book.new(response_obj) }
      }
    end

    def get_image(city_state)
      query = UnsplashService.get_image(city_state)
      Image.new(query[:results].first, city_state) if query[:results]
    end
  end
end
