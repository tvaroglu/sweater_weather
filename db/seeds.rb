# require 'factory_bot_rails'
include FactoryBot::Syntax::Methods

ApiKey.destroy_all
User.destroy_all

# reset PK's
ActiveRecord::Base.connection.tables.each do |t|
  ActiveRecord::Base.connection.reset_pk_sequence!(t)
end

user1 = create(:user)
user2 = user_with_api_key

user3 = create(:user, api_key: '012ffeafdc8dd8b182718f9240')
api_key = create(:api_key, user: user3, value: '012ffeafdc8dd8b182718f9240')
