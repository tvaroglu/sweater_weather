module Response
  def forecast_response(forecast_data, status = :ok)
    render(
      json: {
        data: {
          id: nil,
          type: 'forecast',
          attributes: {
            current_weather: forecast_data[:current_weather],
            daily_weather: forecast_data[:daily_weather],
            hourly_weather: forecast_data[:hourly_weather]
          }
        }
      },
      status: status
    )
  end

  def json_response(object, status = :ok)
    render json: object, status: status
  end

  def json_error_response(status, message, errors)
    render(
      json: {
        message: message,
        errors: [errors]
        # status: status.to_s.tr('_', ' ').titleize
        # code: Rack::Utils::SYMBOL_TO_STATUS_CODE[status]
      },
      status: status
    )
  end
end
