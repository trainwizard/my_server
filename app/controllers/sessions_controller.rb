class SessionsController < ApplicationController

  def new
  end
  
  def create
    @user = User.find_by_username(params[:username])
    if @user && @user.authenticate(params[:password])
      logIn(@user)
      flash[:success] = "You are now logged in #{@user.username}!"
      redirect_to @user
    else
      flash.now[:danger] = "Invalid username or password"
      render 'new'
    end
  end
  
  def destroy
    logOut(@user)
    flash[:info] = "You have logged out!"
    redirect_to root_path
  end

end
