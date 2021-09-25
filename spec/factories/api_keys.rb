FactoryBot.define do
  factory :api_key do
    key { Faker::Alphanumeric.alphanumeric(number: 21) }
    user
  end
end
