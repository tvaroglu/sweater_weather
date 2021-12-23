require 'rails_helper'

# See spec/support/shared_examples/ for shared examples for tests where
# `include_examples` is used. See Shared Examples in the RSpec docs for more
# info:
#   https://relishapp.com/rspec/rspec-core/docs/example-groups/shared-examples
#
# See spec/support/request_spec_helper.rb for #json and #json_data helpers.
describe 'Sessions::Create API', type: :request do
  describe 'POST /api/v1/sessions' do
    let!(:current_user) { user_with_api_key }
    let!(:valid_body) do
      {
        email: 'admin@example.com',
        password: 'guest'
      }
    end

    context 'when the user record exists and authenticates successfully' do
      # before { post '/api/v1/sessions', params: valid_body }

      xit 'returns the user attributes and api key', :aggregate_failures do
        expect(json).not_to be_empty

        expect(json_data.size).to eq 3
        expect(json_data[:attributes].size).to eq 2
        expect(json_data[:attributes][:email]).to eq valid_body[:email]
        expect(json_data[:attributes][:api_key]).to eq current_user.api_key
      end

      # include_examples 'status code 201'
    end

    describe 'edge cases' do
      let!(:message) { 'your record could not be saved' }
      let!(:error_message) { ['invalid credentials provided, please try again'] }

      context 'when the user provides an invalid password' do
        let(:invalid_body) do
          {
            email: 'admin@example.com',
            password: 'GUEST'
          }
        end

        # before { post '/api/v1/sessions', params: invalid_body }

        xit 'returns an error that the credentials are invalid', :aggregate_failures do
          expect(json).not_to be_empty

          expect(json[:message]).to eq message
          expect(json[:errors]).to eq error_message
        end

        # include_examples 'status code 401'
      end

      context 'when the user does not provide a password' do
        let(:invalid_body) { { email: 'admin@example.com' } }

        # before { post '/api/v1/sessions', params: invalid_body }

        xit 'returns an error that the credentials are invalid', :aggregate_failures do
          expect(json).not_to be_empty

          expect(json[:message]).to eq message
          expect(json[:errors]).to eq error_message
        end

        # include_examples 'status code 401'
      end

      context 'when the user does not exist' do
        let(:invalid_body) { { email: 'foo@bar.com' } }

        # before { post '/api/v1/sessions', params: invalid_body }

        xit 'returns an error that the credentials are invalid', :aggregate_failures do
          expect(json).not_to be_empty

          expect(json[:message]).to eq message
          expect(json[:errors]).to eq error_message
        end

        # include_examples 'status code 401'
      end
    end
  end
end
