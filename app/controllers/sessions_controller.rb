class SessionsController < ApplicationController

  def index
  end

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.confirm(params.require(:user).permit(:email, :password))
    if @user
      login(@user)
      flash[:success] = "Successfully logged in."
      redirect_to @user
    else
      flash[:error] = "Invalid email address or password. Please try again."
      redirect_to login_path
    end
  end

  def destroy
    logout
    flash[:success] = "Successfully logged out."
    redirect_to ("/")
  end

end
