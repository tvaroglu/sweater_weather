require 'rails_helper'

RSpec.describe ThirdPartyFacade do
  let(:city_state) { 'denver,co' }
  let(:coordinates) { { lat: 39.738453, lon: -104.984853 } }

  context 'when a city and state are provided' do
    it 'can retrieve the base urls for API calls' do
      expect(MapQuestService.base_url).to eq 'http://www.mapquestapi.com'
      expect(OpenWeatherService.base_url).to eq 'https://api.openweathermap.org'
    end

    it 'can reformat search parameters' do
      expect(MapQuestService.reformat_search('Denver, CO')).to eq city_state
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
  end
end
