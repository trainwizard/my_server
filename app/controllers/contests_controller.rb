class ContestsController < ApplicationController
  before_action :ensure_user_logged_in, only: [:new, :create, :edit, :update,:destroy]
  before_action :ensure_contest_creator, only: [:new, :create, :edit, :update,:destroy]
 
  
  def new
    @contest = current_user.contests.build
  end #new
  
  def create
    @contest = current_user.contests.build(acceptable_params)
    if @contest.save then
      flash[:success] = "Contest #{@contest.name} created!"
      redirect_to @contest     
    else
      render 'new'
    end #if
    end #create
  
  def index
    @contests = Contest.all
  end #index
  
  def show
    @contest = Contest.find(params[:id])
  end #show
  
  def update
    @contest = Contest.find(params[:id])
    if @contest.update_attributes(acceptable_params)
      flash[:success] = "Contest #{@contest.name} updated successfully!"
      redirect_to @contest
    else
      render 'edit'
    end #if
  end #update
  
  def edit
    @contest = Contest.find(params[:id])
  end #edit
  
  def destroy
    @contest = Contest.find(params[:id])
    if !current_user?(@contest)
      @contest.destroy
      flash[:success] = "Contest destroyed."
      redirect_to contests_path
    else
      flash[:danger] = "Can't delete contest."
      redirect_to root_path
    end #destroy
  end
  
  private
    def acceptable_params
      params.require(:contest).permit(:referee_id, :name, :contest_type, :description, :start, :deadline)
    end #accet params
       
    def ensure_user_logged_in
     redirect_to login_path, flash: { :warning => "Unable, please log in!" } unless logged_in? 
    end # ensure user logged in
    
    def ensure_contest_creator 
      redirect_to root_path, flash: { :danger => "You are not a contest creator!" } unless current_user.contest_creator?
    end # ensure contest creatpr
    
end