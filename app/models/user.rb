class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :likes
  has_many :comments

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true, length: { maximum: 50 }
  validates :username, presence: true, uniqueness: true

  # mount_uploader :profile_photo, ProfilePhotoUploader



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
