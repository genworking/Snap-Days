class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :post
  has_many :comments, dependent: :destroy
  has_many :follower_relationships, foreign_key: "following_id", class_name: "Relationship", dependent: :destroy
  has_many :followers, through: :follower_relationships, source: :follower
  has_many :following_relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy
  has_many :followings, through: :following_relationships, source: :following
  has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy
  has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy
  has_many :favorites, dependent: :destroy
  validates :name, presence: true, uniqueness: true, length: { maximum: 50 }
  validates :username, presence: true, uniqueness: true, length: { maximum: 50 }
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }, on: :create
  validates :introduction, length: { maximum: 160 }
  validates :phone_number, length: { maximum: 20 }
  enum sex: { man: 0, woman: 1 }
  mount_uploader :profile_photo, ProfilePhotoUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable

  # ゲストログイン
  def self.guest
    find_or_create_by(email: 'guest@example.com', name: 'ゲストユーザー', username: 'ゲストユーザー') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end

  # ナビバーフォーム検索（無い場合、nilを返す）
  def self.search(search_word)
    find_by('name LIKE(?) or username LIKE(?)', "%#{search_word}%", "%#{search_word}%")
  end

  # URL先name指定
  def to_param
    name
  end

  # ユーザーがフォローしているか調べる
  def following?(other_user)
    following_relationships.find_by(following_id: other_user.id)
  end

  # ユーザーをフォローする
  def follow!(other_user)
    following_relationships.create!(following_id: other_user.id)
  end

  # ユーザーのフォローを外す
  def unfollow!(other_user)
    following_relationships.find_by(following_id: other_user.id).destroy
  end

  # パスワードなしユーザー編集可能
  def update_without_current_password(params, *options)
    params.delete(:current_password)
    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end
    result = update_attributes(params, *options)
    clean_up_passwords
    result
  end

  # FB
  def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first
    unless user
      user = User.create(
        uid: auth.uid,
        provider: auth.provider,
        email: User.dummy_email(auth),
        password: Devise.friendly_token[0, 20]
      )
      user.save(validate: false)
    end
    user
  end

  def create_notification_follow!(current_user)
    temp = Notification.where(["visitor_id = ? and visited_id = ? and action = ? ", current_user.id, id, 'follow'])
    return unless temp.blank?

    notification = current_user.active_notifications.new(
      visited_id: id,
      action: 'follow'
    )
    notification.save if notification.valid?
  end

  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end
end
