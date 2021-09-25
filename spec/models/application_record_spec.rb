require 'rails_helper'

RSpec.describe ApplicationRecord do
  it 'can run a test' do
    expect(ApplicationRecord.hello).to eq 'world'
  end
end
