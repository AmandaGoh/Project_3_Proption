class Listing < ApplicationRecord
  belongs_to :property
  has_many :bids
end
