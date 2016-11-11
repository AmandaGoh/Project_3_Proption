class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   has_many :properties, foreign_key: 'seller_id'
   has_many :bids, foreign_key: 'bidder_id'

   has_many :owned_listings, through: :properties, source: :listing
   has_many :bid_listings, through: :bids, source: :listing

end
