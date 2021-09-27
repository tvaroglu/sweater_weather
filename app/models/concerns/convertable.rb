module Convertable
  def integer_to_datetime(int)
    Time.at(int)
  end

  def kelvin_to_fahrenheit(temp)
    ((temp - 273.15) * 9/5.to_f + 32).round(2)
  end
end
