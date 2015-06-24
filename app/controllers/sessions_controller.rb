class SessionsController < ApplicationController



  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.confirm(params.require(:user).permit(:email, :password))
    if @user
      login(@user)
      flash[:success] = "Successful login"
      redirect_to "/users/#{@user.id}"
    else
      flash[:error] = "Invalid email address or password. Please try again."
      redirect_to root_path
    end
  end

  def destroy
    logout
  end

end
