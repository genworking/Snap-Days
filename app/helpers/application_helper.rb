module ApplicationHelper

  def avatar_url(user)
    return user.profile_photo.url unless user.profile_photo.url.nil?
    gravatar_id = Digest::MD5::hexdigest(user.email).downcase
    "https://ja.gravatar.com/userimage/174693476/8c6a2b179a98780c3c83a2501d773cd9.jpg"
  end
end
