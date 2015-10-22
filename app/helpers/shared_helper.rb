module SharedHelper
  ALERT_TYPES = [:error, :info, :success, :warning] unless const_defined?(:ALERT_TYPES)

  def alertify_notice
    jsReturn = javascript_tag()
    flash.each do |type, message|
      type = type.to_sym unless type.nil?
      # Skip empty messages, e.g. for devise messages set to nothing in a locale file.
      next if message.blank?

      type = :success if type == :notice
      type = :error   if type == :alert
      next unless ALERT_TYPES.include?(type)

      js_alertify = ""
      Array(message).each do |msg|
        js_alertify << "alertify.logPosition('bottom right'); alertify.#{type}('#{msg}');\n" if msg;
      end
      jsReturn = javascript_tag(js_alertify)
    end
    jsReturn.html_safe()
  end

  def nav_li text, path
    active = request.path == path ? :active : nil
    content_tag :li, link_to(text, path), class: active
  end

  def user_name user
    return user.new_record? ? '- Name' : user.username
  end
end