class Bid < ApplicationRecord
  belongs_to :listing
  belongs_to :bidder, class_name: 'User', primary_key: 'id'

  validates :bid_amount, presence: true, length: { maximum: 10 }, numericality: { only_integer: true }

end
