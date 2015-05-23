module ApplicationHelper

  def active_tab(item)
    'active' if params[:controller].include?(item)
  end

end
