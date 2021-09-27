class OpenLibraryService < ThirdPartyService
  class << self
    def base_url
      'https://openlibrary.org'
    end

    def get_books(search_params)
      response = conn(base_url).get("/search.json?q=#{reformat(search_params)}")
      render_request(response.body)
    end

    def reformat(search_params)
      search_params.gsub(/,/, '+')
    end
  end
end
