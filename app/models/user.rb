class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   has_many :properties, foreign_key: 'seller_id'
   has_many :bids, foreign_key: 'bidder_id'
   has_many :owned_listings, through: :properties, source: :listing
   has_many :bid_listings, through: :bids, source: :listing

  #  Only allow letter, number, underscore and punctuation.
   validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true
   validates_format_of :name, with: /^[a-zA-Z0-9]+$/, :multiline => true
   validates :name, presence: true, length: { maximum: 50 }
   validates :contact_number, presence: true, length: { maximum: 8 }, numericality: { only_integer: true }
   validates :username, uniqueness: true, presence: true

end
