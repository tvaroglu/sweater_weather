class Api::V1::ForecastController < ApplicationController
  def index
    location = params[:location]
    lat_long = MapQuestFacade.get_lat_long(location)
    require "pry"; binding.pry
  end
end
