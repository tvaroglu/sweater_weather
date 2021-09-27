class Api::V1::ForecastController < ApplicationController
  def index
    if params[:location].blank?
      json_error_response('your query could not be completed', params_errors[:city_state])
    else
      lat_lon = ThirdPartyFacade.get_lat_lon(params[:location])
      forecast_data = ThirdPartyFacade.get_forecast(lat_lon.lat, lat_lon.lon)
      forecast_response(forecast_data)
    end
  end

  private

  def params_errors
    { city_state: 'please provide a valid city and state' }
  end
end
