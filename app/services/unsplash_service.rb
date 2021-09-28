class UnsplashService < ThirdPartyService
  class << self
    def base_url
      'https://api.unsplash.com'
    end

    def conn
      Faraday.new(base_url) do |req|
        req.headers['Authorization'] = key
      end
    end

    def get_image(city_state)
      response = conn.get("/search/photos?query=#{city_state}")
      render_request(response.body)
    end

    private

    def key
      (ENV['us']).to_s
    end
  end
end
