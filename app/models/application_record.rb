class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.hello
    'world'
  end
end
