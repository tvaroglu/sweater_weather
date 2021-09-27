class HourlyForecast
  include Convertable
  attr_reader :time,
              :temperature,
              :conditions,
              :icon

  def initialize(data)
    @time = integer_to_datetime(data[:dt])
    @temperature = kelvin_to_fahrenheit(data[:temp])
    @conditions = data[:weather].first[:description]
    @icon = data[:weather].first[:icon]
  end
end
