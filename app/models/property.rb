class Property < ApplicationRecord
  belongs_to :seller, class_name: 'User', primary_key: 'id'
  has_one :listing

  mount_uploader :picture, PictureUploader

  validates :name, presence: true, length: { maximum: 50 }
  validates :prop_type, presence: true, length: { maximum: 15 }
  validates :address, presence: true, length: { maximum: 100 }
  validates :postal_code, presence: true, length: { maximum: 6 },  numericality: { only_integer: true }
  validates :reserve_price, presence: true, length: { maximum: 9 },  numericality: { only_integer: true }
  validates :tenure, presence: true, length: { maximum: 8 }
  validates :size, presence: true, length: { maximum: 7 }, numericality: { only_integer: true }
  validates :description, presence: true, length: { maximum: 250 }

end
