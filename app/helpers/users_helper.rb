module UsersHelper
  # Returns the profile picture for the given user.
  def profile_pic_for(user, options = { size: 80 })
    pic_url = "profile_empty.jpg"
    if user.profile_pic_path?
      pic_url = user.profile_pic_path
    end
    image_tag(pic_url,
              alt: user.name,
              width: options[:size],
              height: options[:size])
  end
end
