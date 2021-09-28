class MapQuestService < ThirdPartyService
  class << self
    def base_url
      'http://www.mapquestapi.com'
    end

    def get_lat_lon(city_state)
      response = conn(base_url).get(
        "/geocoding/v1/address?key=#{key}&location=#{city_state}"
      )
      render_request(response.body)
    end

    def get_route(from, to)
      response = conn(base_url).get(
        "/directions/v2/route?key=#{key}&from=#{reformat(from)}&to=#{reformat(to)}"
      )
      render_request(response.body)
    end

    def reformat(search_params)
      search_params.delete(' ').downcase
    end

    private

    def key
      (ENV['mq']).to_s
    end
  end
end
