module ApplicationHelper
  def home_page?
    params[:controller] == 'pages' && params[:action] == 'home'
  end

  def election_page?
    params[:controller] == 'elections' && params[:action] == 'show'
  end
end
