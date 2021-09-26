FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password(max_length: 10) }
    api_key { nil }
  end
end

def user_with_api_key
  FactoryBot.create(:user, email: 'admin@example.com', password: 'guest') do |user|
    user.update_api_key
  end
end
