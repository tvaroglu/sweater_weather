require 'rails_helper'

RSpec.describe ThirdPartyFacade do
  let(:city_state) { 'denver,co' }

  context 'when a city and state are provided' do
    it 'can retrieve the base url for API calls' do
      expect(MapQuestService.base_url).to eq 'http://www.mapquestapi.com'
    end

    it 'can reformat search parameters' do
      expect(MapQuestService.reformat_search('Denver, CO')).to eq city_state
    end

    it 'can return latitude and longitude from search parameters', :vcr do
      expected = ThirdPartyFacade.get_lat_lon(city_state)

      expect(expected.city_state).to eq city_state
      expect(expected.lat.class).to eq Float
      expect(expected.lon.class).to eq Float
    end
  end
end
