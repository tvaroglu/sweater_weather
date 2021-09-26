class ApiKey < ApplicationRecord
  validates :value, uniqueness: true, presence: true
  belongs_to :user
end
