require 'rails_helper'

# See spec/support/shared_examples/ for shared examples for tests where
# `include_examples` is used. See Shared Examples in the RSpec docs for more
# info:
#   https://relishapp.com/rspec/rspec-core/docs/example-groups/shared-examples
#
# See spec/support/request_spec_helper.rb for #json and #json_data helpers.
describe 'Forecast::BookSearch API', type: :request do
  describe 'GET /api/v1/book-search' do
    let(:search_params) { 'denver,co' }
    let(:quantity) { 5 }

    context 'when the user provides a valid city and state', :vcr do
      before { get "/api/v1/book-search?location=#{search_params}&quantity=#{quantity}" }

      it 'returns the books data and associated attributes', :aggregate_failures do
        expect(json).not_to be_empty

        expect(json_data.size).to eq 3
        expect(json_data[:attributes].size).to eq 4
        expect(json_data[:attributes][:destination]).to eq search_params
        expect(json_data[:attributes][:forecast].size).to eq 2
        expect(json_data[:attributes][:forecast][:summary].class).to eq String
        expect(json_data[:attributes][:forecast][:temperature].class).to eq String
        expect(json_data[:attributes][:total_books_found].class).to eq Integer
        expect(json_data[:attributes][:books].size).to eq 5
      end

      include_examples 'status code 200'
    end

    describe 'edge cases' do
      let!(:message) { 'your query could not be completed' }
      let!(:location_error) { ['please provide a valid city and state'] }
      let!(:quantity_error) { ['please provide a valid quantity'] }

      context 'when the user does not provide a valid city and state', :vcr do
        before { get '/api/v1/book-search?location=' }

        it 'returns an error message', :aggregate_failures do
          expect(json).not_to be_empty

          expect(json[:message]).to eq message
          expect(json[:errors]).to eq location_error
        end

        include_examples 'status code 400'
      end

      context 'when the user does not provide a location query parameter', :vcr do
        before { get '/api/v1/book-search' }

        it 'returns an error message', :aggregate_failures do
          expect(json).not_to be_empty

          expect(json[:message]).to eq message
          expect(json[:errors]).to eq location_error
        end

        include_examples 'status code 400'
      end

      context 'when the user does not provide quantity as an integer value', :vcr do
        before { get "/api/v1/book-search?location=#{search_params}&quantity=hdshsdhsh" }

        it 'returns an error message', :aggregate_failures do
          expect(json).not_to be_empty

          expect(json[:message]).to eq message
          expect(json[:errors]).to eq quantity_error
        end

        include_examples 'status code 400'
      end

      context 'when the user does not provide quantity as a positive integer', :vcr do
        before { get "/api/v1/book-search?location=#{search_params}&quantity=0" }

        it 'returns an error message', :aggregate_failures do
          expect(json).not_to be_empty

          expect(json[:message]).to eq message
          expect(json[:errors]).to eq quantity_error
        end

        include_examples 'status code 400'
      end

      context 'when the user provides an empty quantity parameter', :vcr do
        before { get "/api/v1/book-search?location=#{search_params}&quantity=" }

        it 'returns an error message', :aggregate_failures do
          expect(json).not_to be_empty

          expect(json[:message]).to eq message
          expect(json[:errors]).to eq quantity_error
        end

        include_examples 'status code 400'
      end

      context 'when the user does not provide a quantity parameter', :vcr do
        before { get "/api/v1/book-search?location=#{search_params}" }

        it 'returns an error message', :aggregate_failures do
          expect(json).not_to be_empty

          expect(json[:message]).to eq message
          expect(json[:errors]).to eq quantity_error
        end

        include_examples 'status code 400'
      end
    end
  end
end
