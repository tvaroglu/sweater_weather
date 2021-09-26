FactoryBot.define do
  factory :api_key do
    value { Faker::Alphanumeric.alphanumeric(number: 13) }
    user
  end
end
