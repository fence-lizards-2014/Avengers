def current_user
  @current_user ||= User.find_by_id(session[:id]) if session[:id]
end