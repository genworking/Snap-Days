class HashtagPost < ApplicationRecord
  belongs_to :post
  belongs_to :hashtag
  validates :post_id, presence: true
  validates :hashtag_id, presence: true

  scope :search, ->(term) {
    Hashtag.where("hashword LIKE ?", "%#{term}%")
   }
end
