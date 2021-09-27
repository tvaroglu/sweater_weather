class CurrentForecast
  include Convertable
  attr_reader :datetime,
              :sunrise,
              :sunset,
              :temperature,
              :feels_like,
              :humidity,
              :uvi,
              :visibility,
              :conditions,
              :icon

  def initialize(data)
    @datetime = integer_to_datetime(data[:dt])
    @sunrise = integer_to_datetime(data[:sunrise])
    @sunset = integer_to_datetime(data[:sunset])
    @temperature = kelvin_to_fahrenheit(data[:temp])
    @feels_like = kelvin_to_fahrenheit(data[:feels_like])
    @humidity = data[:humidity]
    @uvi = data[:uvi]
    @visibility = data[:visibility]
    @conditions = data[:weather].first[:description]
    @icon = data[:weather].first[:icon]
  end
end
