module MainHelper
  def signed_button
    link_to "登入", new_user_session_path, class: 'btn btn-block btn-danger' if !user_signed_in?
  end
end
