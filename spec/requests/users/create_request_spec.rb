# require 'rails_helper'
#
# # See spec/support/shared_examples/ for shared examples for tests where
# # `include_examples` is used. See Shared Examples in the RSpec docs for more
# # info:
# #   https://relishapp.com/rspec/rspec-core/docs/example-groups/shared-examples
# #
# # See spec/support/request_spec_helper.rb for #json and #json_data helpers.
# describe 'Users::Create API', type: :request do
#   describe 'POST /api/v1/users' do
#     let(:body) do
#       {
#         'email': 'whatever@example.com',
#         'password': 'password',
#         'password_confirmation': 'password'
#       }
#     end
#
#     context 'when the user record does not exist' do
#       before { post '/api/v1/users', body: body.to_json }
#
#       it 'returns the user attributes and api key', :aggregate_failures do
#         expect(json).not_to be_empty
#
#         expect(json_data.size).to eq(3)
#         expect(json_data[:attributes].size).to eq(2)
#       end
#
#       include_examples 'status code 201'
#     end
#   end
# end
#
#     # context 'when the user record does not exist' do
