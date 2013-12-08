class MatchesController < ApplicationController

  def index
    @contest = Contest.find(params[:contest_id])
    @matches = @contest.matches
  end #index
  
  def show
    @match=Match.find(params[:id])
  end #show
end #class
