module SessionsHelper

  # before action :prevent_login_signup

  def login(user)
    session[:user_id] = user.id
    @current_user = user
  end

  def current_user
    @current_user ||= User.find_by({id: session[:user_id]})
  end

  def logged_in?
    if current_user == false
      return false
    else
      return true
    end
  end

  def logout
    @current_user = session[:user_id] = nil
    redirect_to root_path
  end
  #
  # private
  #   def prevent_login_signup
  #     if session[:user_id]
  #       redirect_to user_path()
  #   end
  # end

end
