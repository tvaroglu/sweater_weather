class DailyForecast
  include Convertable
  attr_reader :date,
              :sunrise,
              :sunset,
              :max_temp,
              :min_temp,
              :conditions,
              :icon

  def initialize(data)
    @date = integer_to_datetime(data[:dt])
    @sunrise = integer_to_datetime(data[:sunrise])
    @sunset = integer_to_datetime(data[:sunset])
    @max_temp = kelvin_to_fahrenheit(data[:temp][:max])
    @min_temp = kelvin_to_fahrenheit(data[:temp][:min])
    @conditions = data[:weather].first[:description]
    @icon = data[:weather].first[:icon]
  end
end
