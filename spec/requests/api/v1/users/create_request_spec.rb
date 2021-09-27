require 'rails_helper'

# See spec/support/shared_examples/ for shared examples for tests where
# `include_examples` is used. See Shared Examples in the RSpec docs for more
# info:
#   https://relishapp.com/rspec/rspec-core/docs/example-groups/shared-examples
#
# See spec/support/request_spec_helper.rb for #json and #json_data helpers.
describe 'Users::Create API', type: :request do
  describe 'POST /api/v1/users' do
    let!(:valid_body) do
      {
        email: 'admin@example.com',
        password: 'guest',
        password_confirmation: 'guest'
      }
    end

    context 'when the user record does not exist' do
      before { post '/api/v1/users', params: valid_body }

      it 'returns the user attributes and api key', :aggregate_failures do
        expect(json).not_to be_empty

        expect(json_data.size).to eq 3
        expect(json_data[:attributes].size).to eq 2
        expect(json_data[:attributes][:email]).to eq valid_body[:email]
        expect(json_data[:attributes][:api_key]).to eq User.all.first.api_key
      end

      include_examples 'status code 201'
    end

    context 'when the user record already exists' do
      let!(:existing_user) { user_with_api_key }

      before { post '/api/v1/users', params: valid_body }

      it 'returns an error that the user email is already taken', :aggregate_failures do
        expect(json).not_to be_empty

        message = 'your record could not be saved'
        error_message = ['Email has already been taken']

        expect(json[:message]).to eq message
        expect(json[:errors]).to eq error_message
      end

      include_examples 'status code 422'
    end

    context 'when the password confirmation does not match the password' do
      let(:invalid_body) do
        {
          email: 'admin@example.com',
          password: 'guest',
          password_confirmation: 'GUEST'
        }
      end

      before { post '/api/v1/users', params: invalid_body }

      it 'returns an error that the password confirmation does not match the password', :aggregate_failures do
        expect(json).not_to be_empty

        message = 'your record could not be saved'
        error_message = ["Password confirmation doesn't match Password"]

        expect(json[:message]).to eq message
        expect(json[:errors]).to eq error_message
      end

      include_examples 'status code 422'
    end

    context 'when the password confirmation is not provided' do
      let(:invalid_body) do
        {
          email: 'admin@example.com',
          password: 'guest'
        }
      end

      before { post '/api/v1/users', params: invalid_body }

      it 'returns an error that the password confirmation is required to create a user account', :aggregate_failures do
        expect(json).not_to be_empty

        message = 'your record could not be saved'
        error_message = ["'password_confirmation' is required to create a user account"]

        expect(json[:message]).to eq message
        expect(json[:errors]).to eq error_message
      end

      include_examples 'status code 400'
    end
  end
end
