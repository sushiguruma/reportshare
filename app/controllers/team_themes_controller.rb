class TeamThemesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    theme = Theme.find(params[:theme_id])
    team = Team.find(params[:team][:team_id])
    theme.make_relation(team)
    flash[:success] = 'このテーマとチームを関連づけました。'
    redirect_back(fallback_location: root_url)
  end

  def destroy
    team = Team.find(params[:team_id])
    @theme.break_relation(team)
    flash[:success] = 'このテーマとチームの関連を解除しました。'
    redirect_back(fallback_location: root_url)
  end
end
