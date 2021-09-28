class Api::V1::RoadTripController < ApplicationController
  def create
    if user_params[:api_key].blank? || ApiKey.find_by(value: user_params[:api_key]).blank?
      json_error_response(
        'your query could not be completed',
        params_errors[:api_key],
        :unauthorized
      )
    elsif user_params[:origin].blank? || user_params[:destination].blank?
      json_error_response('your query could not be completed', params_errors[:missing_params])
    end
    # require "pry"; binding.pry
  end

  private

  def params_errors
    {
      api_key: 'invalid API key',
      impossible_route: 'impossible route',
      missing_params: 'origin and destination are required to plan a route'
    }
  end

  def user_params
    params.permit(:origin, :destination, :api_key)
  end
end
