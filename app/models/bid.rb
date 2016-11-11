class Bid < ApplicationRecord
  belongs_to :listing
  belongs_to :bidder, class_name: 'User', primary_key: 'id'
end
