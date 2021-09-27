module Response
  def book_search_response(books_data, forecast_data, status = :ok)
    render(
      json: {
        data: {
          id: nil,
          type: 'books',
          attributes: {
            destination: books_data[:destination],
            forecast: {
              summary: forecast_data.conditions,
              temperature: "#{forecast_data.temperature.round} F"
            },
            total_books_found: books_data[:total_books_found],
            books: books_data[:books]
          }
        }
      }
    )
  end

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
      },
      status: status
    )
  end
end
