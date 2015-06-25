class SessionsController < ApplicationController

  def index
    @user = User.new
  end

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.confirm(params.require(:user).permit(:email, :password))
    if @user
      login(@user)
      flash[:success] = "Successful login"
      redirect_to @user
    else
      flash[:error] = "Invalid email address or password. Please try again."
      redirect_to login_path
    end
  end

  def destroy
    logout
    flash[:success] = "successfully logged out"
    redirect_to ("/")
  end

end
