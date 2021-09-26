require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relationships' do
    it { should have_many(:api_keys).dependent(:destroy) }
  end

  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:password) }
    it { should validate_uniqueness_of(:api_key) }
    it { should allow_value(nil).for(:api_key) }
  end

  describe 'factories' do
    describe 'user' do
      subject(:user) { create(:user) }

      it 'is valid with valid attributes' do
        expect(user).to be_valid
      end
    end

    describe '#user_with_api_key' do
      subject(:user) { user_with_api_key }

      it 'is valid with valid attributes' do
        expect(user).to be_valid
        expect(user.api_keys.size).to eq 1
        expect(user.api_key).to eq(user.api_keys.first.value)
      end
    end
  end

  describe 'instance methods' do
    describe '#update_api_key' do
      let(:user) { create(:user) }

      it 'can update the api key for the user' do
        expect(user.api_keys).to be_empty
        expect(user.api_key).to eq nil

        user.update_api_key

        expect(user.api_keys.size).to eq 1
        expect(user.api_key).to eq user.api_keys.first.value
      end
    end
  end
end
