module ApplicationHelper

  def avatar_url(user)
    return user.profile_photo unless user.profile_photo.nil?
    gravatar_id = Digest::MD5::hexdigest(user.email).downcase
    "https://raw.githubusercontent.com/genworking/insta_clone5/develop/app/javascript/images/gravatar-icon.jpg?token=APZMHEUSHDRXJSAQZ7KZUHC77EF4Q"
  end

end
