class Api::V1::BookSearchController < ApplicationController

  def index
    lat_lon = ThirdPartyFacade.get_lat_lon(params[:location])
    current_forecast = ThirdPartyFacade.get_forecast(lat_lon.lat, lat_lon.lon)[:current_weather]
    books = ThirdPartyFacade.get_books(params[:location], params[:quantity])
    book_search_response(books, current_forecast)
  end



  # def index
  #   if params[:location].blank?
  #     json_error_response(
  #       :bad_request,
  #       'your query could not be completed',
  #       'please provide a valid city and state'
  #     )
  #   else
  #     lat_lon = ThirdPartyFacade.get_lat_lon(params[:location])
  #     forecast_data = ThirdPartyFacade.get_forecast(lat_lon.lat, lat_lon.lon)
  #     forecast_response(forecast_data)
  #   end
  # end
end
