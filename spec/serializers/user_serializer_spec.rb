require 'rails_helper'

describe 'UserSerializer', type: :serializer do
  describe 'instance methods' do
    describe '#serializable_hash' do
      context 'when I provide a valid user' do
        let(:user) { user_with_api_key }
        let(:user_hash) { UserSerializer.new(user).serializable_hash }
        let(:user_data) { user_hash[:data] }
        let(:user_attributes) { user_data[:attributes] }

        it 'formats the single user response for delivery', :aggregate_failures do
          expect(user_hash).to be_a Hash
          expect(user_hash.size).to eq(1)

          expect(user_hash).to have_key(:data)

          expect(user_data).to be_a Hash
          expect(user_data.size).to eq(3)

          expect(user_data).to have_key(:id)
          expect(user_data[:id]).to be_a String

          expect(user_data).to have_key(:type)
          expect(user_data[:type]).to be_a Symbol
          expect(user_data[:type]).to eq(:user)

          expect(user_data).to have_key(:attributes)
          expect(user_attributes).to be_a Hash
          expect(user_attributes.size).to eq(2)

          expect(user_attributes).to have_key(:email)
          expect(user_attributes[:email]).to be_a String

          expect(user_attributes).to have_key(:api_key)
          expect(user_attributes[:api_key]).to be_a String
        end
      end

      context 'when I provide no valid user' do
        subject(:empty_user) { UserSerializer.new(nil).serializable_hash }

        it 'returns a hash with data as nil' do
          expect(empty_user).to be_a Hash
          expect(empty_user.size).to eq(1)

          expect(empty_user).to have_key(:data)
          expect(empty_user[:data]).to be_nil
        end
      end
    end
  end
end
