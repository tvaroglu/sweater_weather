class Image
  attr_reader :location,
              :image_url,
              :provider,
              :photographer,
              :photographer_profile_url

  def initialize(data, city_state)
    @location = city_state
    @image_url = data[:urls][:raw]
    @provider = 'Unsplash'
    @photographer = data[:user][:name]
    @photographer_profile_url = data[:user][:links][:html]
  end
end
