class Route
  attr_reader :from, :to, :travel_time, :formatted_travel_time

  def initialize(data, from, to)
    @from = from
    @to = to
    @travel_time = data[:formattedTime]
    @formatted_travel_time = reformat(@travel_time)
  end

  def reformat(travel_time)
    split = travel_time.split(':')
    "#{split[0]}h#{split[1]}m".delete_prefix('0')
  end
end
