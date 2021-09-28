require 'rails_helper'

# See spec/support/shared_examples/ for shared examples for tests where
# `include_examples` is used. See Shared Examples in the RSpec docs for more
# info:
#   https://relishapp.com/rspec/rspec-core/docs/example-groups/shared-examples
#
# See spec/support/request_spec_helper.rb for #json and #json_data helpers.
describe 'RoadTrip::Create API', type: :request do
  describe 'POST /api/v1/roadtrip' do
    let(:current_user) { user_with_api_key }
    let(:api_key) { user_with_api_key.api_key }

    let!(:message) { 'your query could not be completed' }
    let!(:auth_error_message) { ['invalid API key'] }
    let!(:route_error_message) { ['origin and destination are required to plan a route'] }

    context 'when the user is authenticated and provides a valid request', :vcr do
      let(:valid_route) do
        {
          origin: 'Denver,CO',
          destination: 'Pueblo,CO',
          api_key: api_key
        }
      end

      before { post '/api/v1/road_trip', params: valid_route }

      it 'returns the requested road trip attributes', :aggregate_failures do
        expect(json).not_to be_empty

        expect(json_data.size).to eq 3
        expect(json_data[:attributes].size).to eq 4
        expect(json_data[:attributes][:weather_at_eta].size).to eq 2
        expect(json_data[:attributes][:weather_at_eta][:temperature].class).to eq Float
        expect(json_data[:attributes][:weather_at_eta][:conditions].class).to eq String
      end

      include_examples 'status code 201'
    end

    context 'when the user is authenticated and provides an invalid request', :vcr do
      let(:invalid_route) do
        {
          origin: 'Denver,CO',
          destination: 'London,UK',
          api_key: api_key
        }
      end

      before { post '/api/v1/road_trip', params: invalid_route }

      it 'returns road trip attributes with an impossible route and empty forecast', :aggregate_failures do
        expect(json).not_to be_empty

        expect(json_data.size).to eq 3
        expect(json_data[:attributes].size).to eq 4
        expect(json_data[:attributes][:travel_time]).to eq 'Impossible Route'
        expect(json_data[:attributes][:weather_at_eta].size).to eq 2
        expect(json_data[:attributes][:weather_at_eta][:temperature].class).to eq NilClass
        expect(json_data[:attributes][:weather_at_eta][:conditions].class).to eq NilClass
      end

      include_examples 'status code 201'
    end

    context 'when the user does not provide an API key' do
      let(:invalid_body) do
        {
          origin: 'Denver,CO',
          destination: 'Pueblo,CO'
        }
      end

      before { post '/api/v1/road_trip', params: invalid_body }

      it 'returns an error that the user is unauthorized', :aggregate_failures do
        expect(json).not_to be_empty

        expect(json[:message]).to eq message
        expect(json[:errors]).to eq auth_error_message
      end

      include_examples 'status code 401'
    end

    context 'when the user does not provide a valid API key' do
      let(:invalid_body) do
        {
          origin: 'Denver,CO',
          destination: 'Pueblo,CO',
          api_key: 'fddsfsdsf'
        }
      end

      before { post '/api/v1/road_trip', params: invalid_body }

      it 'returns an error that the user is unauthorized', :aggregate_failures do
        expect(json).not_to be_empty

        expect(json[:message]).to eq message
        expect(json[:errors]).to eq auth_error_message
      end

      include_examples 'status code 401'
    end

    context 'when the user does not provide route parameters' do
      let(:invalid_body) do
        {
          origin: 'Denver,CO',
          api_key: api_key
        }
      end

      before { post '/api/v1/road_trip', params: invalid_body }

      it 'returns an error that the user is unauthorized', :aggregate_failures do
        expect(json).not_to be_empty

        expect(json[:message]).to eq message
        expect(json[:errors]).to eq route_error_message
      end

      include_examples 'status code 400'
    end
  end
end
