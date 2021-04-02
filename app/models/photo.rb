class Photo < ApplicationRecord
  belongs_to :post
  has_one_attached :image
  validates :image, presence: true
  
  mount_uploader :image, ImageUploader

end
