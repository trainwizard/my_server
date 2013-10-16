module SessionsHelper
  def current_user
    @current_user ||= User.find(cookies.signed[:user_id]) if cookies.signed[:user_id]
  end #current user
  
  def current_user?(user)
    current_user == user
  end #current user?
  
  def logged_in?
    #!cookies[:user_id].nil?
    !current_user.nil?
  end #logged in?
end
