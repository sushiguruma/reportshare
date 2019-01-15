class RelationshipsController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    team = Team.find(params[:team_id])
    current_user.join(team)
    flash[:success] = 'チームに参加しました。'
    redirect_back(fallback_location: root_path)
  end

  def destroy
    team = Team.find(params[:team_id])
    unless current_user == team.user
      current_user.leave(team)
      flash[:success] = 'チームから離脱しました。'
      redirect_back(fallback_location: root_path)
    else
      flash[:danger] = 'チーム作成者は離脱できません。'
      redirect_back(fallback_location: root_path)
    end
  end
end
