module ApplicationHelper

  def avatar_url(user)
    if user.nil?
      avatar_url = "/withdrawal-icon.png"
    elsif user.profile_photo.url.nil?
      avatar_url = "/default-cyan-icon.png"
    else
      avatar_url = user.profile_photo.url
    end
  end
end
