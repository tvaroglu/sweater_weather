class MapQuestService < ApiService
  class << self
    def base_url
      "http://www.mapquestapi.com"
    end

    def get_lat_long(city_state)
      response = conn(base_url).get("/geocoding/v1/address?key=#{key}&location=#{city_state}")
      render_request(response.body)
    end

    # TODO: refactor method as necessary..
    # (may not be needed based on how query params are sent??)
    def reformat_search(search_params)
      search_params.gsub(/ /, '').downcase
    end

    private

    def key
      "#{ENV['mq']}"
    end
  end
end
