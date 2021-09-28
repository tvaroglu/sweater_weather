class OpenWeatherService < ThirdPartyService
  class << self
    def base_url
      'https://api.openweathermap.org'
    end

    def get_forecast(lat, lon)
      response = conn(base_url).get(
        "/data/2.5/onecall?appid=#{key}&lat=#{lat}&lon=#{lon}&exclude=minutely"
      )
      render_request(response.body)
    end

    def get_hourly_forecast(lat, lon)
      response = conn(base_url).get(
        "/data/2.5/onecall?appid=#{key}&lat=#{lat}&lon=#{lon}&exclude=current,daily,minutely"
      )
      render_request(response.body)
    end

    private

    def key
      (ENV['ow']).to_s
    end
  end
end
