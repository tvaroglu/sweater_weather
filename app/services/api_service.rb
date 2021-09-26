class ApiService
  class << self
    def conn(url)
      Faraday.new(url)
    end

    def render_request(response_body)
      JSON.parse(response_body, symbolize_names: true)
    end
  end
end
