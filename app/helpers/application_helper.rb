module ApplicationHelper

  def active_tab(item)
    # controller.split("/").last == item ? 'active': ''
    # controller.split("/").first == item ? 'active': ''
    'active' if params[:controller].include?(item)
  end

end
