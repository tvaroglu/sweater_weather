class Api::V1::ForecastController < ApplicationController
  def index
    # location = params[:location]
    lat_lon = ThirdPartyFacade.get_lat_lon(params[:location])
    forecast_data = ThirdPartyFacade.get_forecast(lat_lon.lat, lat_lon.lon)
    forecast_response(forecast_data)
  end
end
