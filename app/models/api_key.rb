class ApiKey < ApplicationRecord
  validates :key, uniqueness: true, presence: true
  belongs_to :user
end
