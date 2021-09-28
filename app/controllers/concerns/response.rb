module Response
  def road_trip_response(route_data, forecast_data, status = :created)
    render(
      json: {
        data: {
          id: nil,
          type: 'roadtrip',
          attributes: {
            start_city: route_data.from,
            end_city: route_data.to,
            travel_time: route_data.formatted_travel_time,
            weather_at_eta: {
              temperature: forecast_data.present? ? forecast_data.temperature : nil,
              conditions: forecast_data.present? ? forecast_data.conditions : nil
            }
          }
        }
      },
      status: status
    )
  end

  def image_response(image_data, status = :ok)
    render(
      json: {
        data: {
          id: nil,
          type: 'image',
          attributes: {
            image: {
              location: image_data.location,
              image_url: image_data.image_url
            },
            credit: {
              provider: image_data.provider,
              photographer: image_data.photographer,
              photographer_profile_url: image_data.photographer_profile_url
            }
          }
        }
      },
      status: status
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
      },
      status: status
    )
  end

  def json_response(object, status = :ok)
    render json: object, status: status
  end

  def json_error_response(message, errors, status = :bad_request)
    render(
      json: {
        message: message,
        errors: [errors]
      },
      status: status
    )
  end
end
