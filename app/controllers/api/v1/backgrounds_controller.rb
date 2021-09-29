class Api::V1::BackgroundsController < ApplicationController
  def index
    if params[:location].blank?
      json_error_response(invalid_query, params_errors[:city_state])
    else
      image = ThirdPartyFacade.get_image(params[:location])
      image_response(image)
    end
  end

  private

  def params_errors
    { city_state: 'please provide a valid city and state' }
  end
end
