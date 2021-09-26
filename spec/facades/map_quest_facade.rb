require 'rails_helper'

RSpec.describe MapQuestFacade do
  let(:city_state) { 'denver,co' }

  context 'retrieve latitude and longitude from city and state' do
    it 'can retrieve the base url for API calls' do
      expect(MapQuestService.base_url).to eq "http://www.mapquestapi.com"
    end

    it 'can reformat search parameters' do
      expect(MapQuestService.reformat_search('Denver, CO')).to eq city_state
    end

    it 'can return latitude and longitude from search parameters', :vcr do
      expected = MapQuestFacade.get_lat_long(city_state)

      expect(expected.city_state).to eq city_state
      expect(expected.lat.class).to eq Float
      expect(expected.long.class).to eq Float
    end
  end
end
