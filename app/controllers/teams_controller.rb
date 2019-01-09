class TeamsController < ApplicationController
  before_action :require_user_logged_in
  before_action :team_author, only: [:edit, :update, :destroy]
  
  def index
    @teams = Team.all.order('created_at DESC').page(params[:page])
  end
  
  def show
    @team = Team.find(params[:id])
  end
  
  def new
    @team = Team.new
  end
  
  def create
    @team = current_user.teams.build(team_params)
    
    if @team.save
      flash[:success] = '新しいチームを作成しました。'
      redirect_to root_url
    else
      flash.now[:danger] = 'チームの作成に失敗しました。'
      render :new
    end
  end
  
  def edit
    
  end
  
  def update
    
    if @team.update(team_params)
      flash[:success] = 'チームの内容を更新しました。'
      redirect_to team_path(@team)
    else
      flash.now[:danger] = 'チーム内容の更新に失敗しました。'
      render :edit
    end
  end
  
  def destroy
    @team.destroy
    
    flash[:success] = 'チームを削除しました。'
    redirect_to root_url
  end
  
  private
  
  def team_params
    params.require(:team).permit(:name, :content)
  end
  
  def team_author
    @team = current_user.teams.find_by(id: params[:id])
    unless @team
      redirect_to root_url
    end
  end
  
end
