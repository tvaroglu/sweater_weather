class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true
  has_secure_password
  validates :api_key, uniqueness: true, allow_nil: true
  has_many :api_keys, dependent: :destroy

  def update_api_key
    api_keys.destroy_all
    new_key = api_keys.create!(value: SecureRandom.hex(13)).value

    update!(api_key: new_key)
  end
end
