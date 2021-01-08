class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments
  has_many :following_relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy
  has_many :followings, through: :following_relationships
  has_many :follower_relationships, foreign_key: "following_id", class_name: "Relationship", dependent: :destroy
  has_many :followers, through: :follower_relationships

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true, length: { maximum: 50 }, uniqueness: true
  validates :username, presence: true, uniqueness: true

  # mount_uploader :profile_photo, ProfilePhotoUploader

  # URL先name指定
  def to_param
    name
  end

  # ユーザーをフォローする
  def following?(other_user)
    following_relationships.find_by(following_id: other_user.id)
  end

  # ユーザーがフォローしているか調べる
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

end
