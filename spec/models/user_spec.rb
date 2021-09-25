require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relationships' do
    it { should have_many(:api_keys).dependent(:destroy) }
  end

  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:password) }
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
      end
    end
  end
end
