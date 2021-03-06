require 'rails_helper'

RSpec.describe ThirdPartyFacade do
  let(:city_state) { 'denver,co' }
  let(:coordinates) { { lat: 39.738453, lon: -104.984853 } }

  context 'when a city and state are provided' do
    it 'can retrieve the base urls for API calls' do
      expect(MapQuestService.base_url).to eq 'http://www.mapquestapi.com'
      expect(OpenWeatherService.base_url).to eq 'https://api.openweathermap.org'
      expect(OpenLibraryService.base_url).to eq 'https://openlibrary.org'
      expect(UnsplashService.base_url).to eq 'https://api.unsplash.com'
    end

    it 'can reformat search parameters' do
      expect(MapQuestService.reformat('Denver, CO')).to eq city_state
      expect(OpenLibraryService.reformat(city_state)).to eq 'denver+co'
    end

    it 'can return latitude and longitude from search parameters', :vcr do
      expected = ThirdPartyFacade.get_lat_lon(city_state)

      expect(expected.city_state).to eq city_state
      expect(expected.lat.class).to eq Float
      expect(expected.lon.class).to eq Float
    end

    it 'can return forecast data from lat/lon coordinates', :vcr do
      expected = ThirdPartyFacade.get_forecast(coordinates[:lat], coordinates[:lon])
      expect(expected.size).to eq 3

      current_weather = expected[:current_weather]
      expect(current_weather.class).to eq CurrentForecast
      expect(current_weather.conditions.class).to eq String
      expect(current_weather.datetime.class).to eq Time
      expect(current_weather.feels_like.class).to eq Float
      expect(current_weather.humidity.class).to eq Integer
      expect(current_weather.icon.class).to eq String
      expect(current_weather.sunrise.class).to eq Time
      expect(current_weather.sunset.class).to eq Time
      expect(current_weather.temperature.class).to eq Float
      expect(current_weather.uvi.class).to eq Float
      expect(current_weather.visibility.class).to eq Integer

      daily_weather = expected[:daily_weather]
      expect(daily_weather.size).to eq 5
      daily_weather.each do |record|
        expect(record.class).to eq DailyForecast
        expect(record.conditions.class).to eq String
        expect(record.date.class).to eq Time
        expect(record.icon.class).to eq String
        expect(record.max_temp.class).to eq Float
        expect(record.min_temp.class).to eq Float
        expect(record.sunrise.class).to eq Time
        expect(record.sunset.class).to eq Time
      end

      hourly_weather = expected[:hourly_weather]
      expect(hourly_weather.size).to eq 8
      hourly_weather.each do |record|
        expect(record.class).to eq HourlyForecast
        expect(record.conditions.class).to eq String
        expect(record.icon.class).to eq String
        expect(record.time.class).to eq Time
        expect(record.temperature.class).to eq Float
      end
    end

    it 'can return x number of books from a city/state search', :vcr do
      expected = ThirdPartyFacade.get_books(city_state, 5)

      expect(expected.size).to eq 3
      expect(expected[:destination]).to eq city_state
      expect(expected[:total_books_found].class).to eq Integer
      expect(expected[:books].length).to eq 5

      expected[:books].each do |book|
        expect(book.class).to eq Book
        expect(book.isbn.class).to eq Array
        expect(book.publisher.class).to eq Array
        expect(book.title.class).to eq String
      end
    end

    it 'can return an image from a city/state search', :vcr do
      expected = ThirdPartyFacade.get_image(city_state)

      expect(expected.class).to eq Image
      expect(expected.location).to eq city_state
      expect(expected.image_url.class).to eq String
      expect(expected.provider).to eq 'Unsplash'
      expect(expected.photographer.class).to eq String
      expect(expected.photographer_profile_url.class).to eq String
    end

    describe '#get_route' do
      let(:valid_destination) { 'Washington, DC' }
      let(:invalid_destination) { 'London, UK' }

      it 'can return a route object for a possible route', :vcr do
        expected = ThirdPartyFacade.get_route(city_state, valid_destination)

        expect(expected.from).to eq city_state
        expect(expected.to).to eq valid_destination
        expect(expected.travel_time.class).to eq String
        expect(expected.travel_time).not_to eq 'Impossible Route'
        expect(expected.formatted_travel_time.class).to eq String
        expect(expected.formatted_travel_time).not_to eq 'Impossible Route'
      end

      it 'can return a route object for an impossible route', :vcr do
        expected = ThirdPartyFacade.get_route(city_state, invalid_destination)

        expect(expected.travel_time).to eq 'Impossible Route'
        expect(expected.formatted_travel_time).to eq 'Impossible Route'
      end
    end

    describe '#get_route_forecast' do
      let(:valid_destination) { 'Washington, DC' }
      let(:invalid_destination) { 'London, UK' }

      it 'can return a forecast object for a possible route', :vcr do
        lat_lon = ThirdPartyFacade.get_lat_lon(valid_destination)
        route = ThirdPartyFacade.get_route(city_state, valid_destination)
        expected = ThirdPartyFacade.get_route_forecast(lat_lon.lat, lat_lon.lon, route.travel_time)

        expect(route.travel_time).not_to eq 'Impossible Route'
        expect(route.formatted_travel_time).not_to eq 'Impossible Route'
        expect(expected.conditions.class).to eq String
        expect(expected.temperature.class).to eq Float
      end

      it 'can return a blank forecast object for an impossible route', :vcr do
        lat_lon = ThirdPartyFacade.get_lat_lon(valid_destination)
        route = ThirdPartyFacade.get_route(city_state, invalid_destination)
        expected = ThirdPartyFacade.get_route_forecast(lat_lon.lat, lat_lon.lon, route.travel_time)

        expect(route.travel_time).to eq 'Impossible Route'
        expect(route.formatted_travel_time).to eq 'Impossible Route'
        expect(expected).to be_blank
      end
    end
  end
end
