module ApplicationHelper
  def signed_slidebar
    if user_signed_in?
      content_tag :div, (render 'shared/slidebar'), class: 'col-sm-2 col-md-2', id: 'oERP-slidebar'
    end
  end

  def signed_id
    return 'oERP-contain' if user_signed_in?
  end

  def signed_yieldclass
    value = user_signed_in? ? 'col-sm-7' : (
      (["/home","/","/about"].include? request.path) ? 'col-sm-6 col-sm-offset-3' : 'col-sm-3 col-md-2 col-sm-offset-5')

    return value
  end
end