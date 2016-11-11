class Property < ApplicationRecord
  belongs_to :seller, class_name: 'User', primary_key: 'id'
  has_one :listing

  mount_uploader :picture, PictureUploader
end
