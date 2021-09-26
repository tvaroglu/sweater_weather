class MapQuestService < ApiService
  class << self
    def key
      "#{ENV['mq']}"
    end

    def base_url
      "http://www.mapquestapi.com"
    end

    def get_lat_long(city_state)
      response = conn(base_url).get("/geocoding/v1/address?key=#{key}&location=#{city_state}")
      render_request(response.body)
    end

    # TODO: remove or refactor method as necessary
    # (may not be needed based on how query params are sent??)
    def reformat_search(search_params)
      search_params.gsub(/ /, '')
    end
  end
end
