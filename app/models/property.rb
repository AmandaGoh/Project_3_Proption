class Property < ApplicationRecord
  belongs_to :user
  has_one :listing
end
