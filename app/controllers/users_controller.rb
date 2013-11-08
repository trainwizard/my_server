class UsersController < ApplicationController
  before_action :ensure_user_logged_in, only: [:edit, :update]
  before_action :ensure_correct_user, only: [:edit, :update]
  #before_action :ensure_admin_user, only: [:destroy]
  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(permittedparams)    
    if @user.save then
      flash[:success] = "Welcome #{@user.username}"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def show
    @user = User.find(params[:id])
  end

  def edit 
    @user = User.find(params[:id])
  end
    
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(permittedparams)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path      
  end
    
    
  private
    def permittedparams
      permittedparams = params.require(:user).permit(:username,:password,:password_confirmation,:email)
    end    
    def ensure_user_logged_in
      redirect_to root_path unless logged_in?
      
    end #ensure user logegd in
    def ensure_correct_user
      @user = User.find(params[:id])
      redirect_to root_path unless current_user?(@user)
    end #ensure_correct_user
    #def ensure_admin_user
    #  redirect_to user_path unless current_user.admin?
   # end #ensure_admin_user
    
  end