require 'rails_helper'

RSpec.describe ApplicationRecord do
  # placeholder to ensure Gemfile setup and application configs are correct
  it 'can run a test' do
    expect(ApplicationRecord.hello).to eq 'world'
  end
end
