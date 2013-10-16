class SessionsController < ApplicationController
  def new    
  end #new end
  
  def create
      @user = User.find_by(username:params[:username])
      
      if @user.authenticate(params[:password])
        cookies.signed[:user_id] = @user.id
        flash[:success] ="#{@user.username} logged on."
        redirect_to @user
      else 
        flash.now[:danger] = "wrong username or password"
        render 'new'
      end
  end #create end
  
  def destroy
  end #destroy end
  

end #class end
