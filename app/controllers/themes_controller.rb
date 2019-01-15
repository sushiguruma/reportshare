class ThemesController < ApplicationController
  before_action :require_user_logged_in
  before_action :theme_author, only: [:edit, :update, :destroy]
  
  def index
    @themes = Theme.all.order('created_at DESC').page(params[:page])
  end
  
  def show
    @theme = Theme.find_by(id: params[:id])
  end

  def new
    @team = Team.find(params[:team_id])
    @theme = current_user.themes.new
  end

  def create
    @team = Team.find(params[:team_id])
    @theme = current_user.themes.build(theme_params)
    
    if @theme.save
      @theme.make_relation(@team)
      flash[:success] = 'テーマを投稿しました。'
      redirect_to theme_path(@theme)
    else
      flash[:danger] = 'テーマの投稿に失敗しました。'
      render :new
    end
  end

  def edit
    
  end

  def update
    
    
    if @theme.update(theme_params)
      flash[:success] = 'テーマを編集しました。'
      redirect_to theme_path(@theme)
    else
      flash[:danger] = 'テーマの編集に失敗しました。'
      render :new
    end
  end

  def destroy
    @theme.destroy
    flash[:success] = 'テーマを削除しました。'
    redirect_back(fallback_location: root_path)
  end
  
  private
  
  def theme_params
    params.require(:theme).permit(:name, :introduction, :objective, :followed_teams)
  end
  
  def theme_author
    @theme = current_user.themes.find_by(id: params[:id])
    unless @theme
      redirect_to root_url
    end
  end
end
