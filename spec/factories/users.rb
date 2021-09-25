FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password(max_length: 10) }
  end
end

def user_with_api_key
  FactoryBot.create(:user, email: 'admin@example.com', password: 'guest') do |user|
    FactoryBot.create(:api_key, user: user)
  end
end
