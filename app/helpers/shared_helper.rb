module SharedHelper
  def nav_li text, path
    active = request.path == path ? :active : nil
    content_tag :li, link_to(text, path), class: active
  end

  def user_name user
    return user.new_record? ? '- Name' : user.username
  end
end