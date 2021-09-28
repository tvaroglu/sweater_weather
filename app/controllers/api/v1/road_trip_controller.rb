class Api::V1::RoadTripController < ApplicationController
  def create
    if user_params[:api_key].blank? || ApiKey.find_by(value: user_params[:api_key]).blank?
      json_error_response('your query could not be completed', params_errors[:auth], :unauthorized)
    elsif user_params[:origin].blank? || user_params[:destination].blank?
      json_error_response('your query could not be completed', params_errors[:route])
    else
      lat_lon = ThirdPartyFacade.get_lat_lon(user_params[:destination])
      route = ThirdPartyFacade.get_route(user_params[:origin], user_params[:destination])
      forecast = ThirdPartyFacade.get_destination_forecast(lat_lon.lat, lat_lon.lon, route.travel_time)
      road_trip_response(route, forecast)
    end
  end

  private

  def params_errors
    {
      auth: 'invalid API key',
      route: 'origin and destination are required to plan a route'
    }
  end

  def user_params
    params.permit(:origin, :destination, :api_key)
  end
end
