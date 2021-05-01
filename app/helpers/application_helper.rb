module ApplicationHelper
  def avatar_url(user)
    if user.nil?
      "/withdrawal-icon.png"
    elsif user.profile_photo.url.nil?
      "/default-cyan-icon.png"
    else
      user.profile_photo.url
    end
  end
end
