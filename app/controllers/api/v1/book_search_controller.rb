class Api::V1::BookSearchController < ApplicationController
  def index
    if params[:location].blank?
      json_error_response('your query could not be completed', params_errors[:city_state])
    elsif params[:quantity].to_i <= 0
      json_error_response('your query could not be completed', params_errors[:quantity])
    else
      lat_lon = ThirdPartyFacade.get_lat_lon(params[:location])
      current_forecast = ThirdPartyFacade.get_forecast(lat_lon.lat, lat_lon.lon)[:current_weather]
      books = ThirdPartyFacade.get_books(params[:location], params[:quantity])
      book_search_response(books, current_forecast)
    end
  end

  private

  def params_errors
    {
      city_state: 'please provide a valid city and state',
      quantity: 'please provide a valid quantity'
    }
  end
end
