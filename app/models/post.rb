class Post < ApplicationRecord
  belongs_to :user
  has_many :photos, dependent: :destroy

  # ここに追加
  accepts_nested_attributes_for :photos
end
