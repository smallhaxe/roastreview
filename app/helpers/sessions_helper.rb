module SessionsHelper

  def login(user)
    session[:user_id] = user.id
    session[:user_first_name] = user.first_name
    @current_user = user
  end

  def logged_in?
  	unless current_user
  		redirect_to login_path
		end
	end

  def current_user
    return false if session[:user_id] == nil
    @current_user ||= User.find_by({id: session[:user_id]})
  end

  def logout
  	@current_user = session[:user_id] = nil
	end
end

