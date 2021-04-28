class Hashtag < ApplicationRecord
  validates :hashname, presence: true, length: { maximum: 136 }
  has_many :hashtag_posts, dependent: :destroy
  has_many :posts, through: :hashtag_posts

  def self.search(search_word)
    find_by(['hashname LIKE ?', "%#{search_word}%"])
  end
end
