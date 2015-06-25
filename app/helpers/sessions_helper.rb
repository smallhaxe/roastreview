module SessionsHelper
  
  def current_user
    return false if session[:user_id] == nil
    @current_user ||= User.find(session[:user_id])
    # binding.pry
  end
  
  def logged_in?
    unless current_user
      redirect_to ("/")
    end
  end

  def login(user)
    session[:user_id] = user.id
    @current_user = user
  end
  
  def logout
    @current_user = session[:user_id] = nil
  end

end

