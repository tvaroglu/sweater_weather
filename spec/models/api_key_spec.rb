require 'rails_helper'

RSpec.describe ApiKey, type: :model do
  describe 'relationships' do
    it { should belong_to(:user) }
  end

  describe 'validations' do
    it { should validate_presence_of(:key) }
    it { should validate_uniqueness_of(:key) }
  end

  describe 'factories' do
    describe 'api_key' do
      subject(:api_key) { create(:api_key) }

      it 'is valid with valid attributes' do
        expect(api_key).to be_valid
        expect(api_key.user).to be_valid
      end
    end
  end
end
