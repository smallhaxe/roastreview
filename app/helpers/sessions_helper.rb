module SessionsHelper
  
  def login(user)
    session[:user_id] = user.id
    @current_user = user
  end
  
  def current_user
    return false if session[:user_id] == nil
    @current_user ||= User.find(session[:user_id])
  end

end
