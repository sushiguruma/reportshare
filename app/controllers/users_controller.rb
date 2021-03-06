class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:show, :edit, :destroy]
  
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = 'ユーザーを登録しました。'
      redirect_to login_path
    else
      flash[:danger] = 'ユーザー登録に失敗しました。'
      render :new
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    
    if @user.update(user_params)
      flash[:success] = 'ユーザー情報を更新しました。'
      redirect_to user_path(current_user)
    else
      flash[:danger] = 'ユーザー情報の更新に失敗しました。'
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    session[:user_id] = nil
    
    flash[:success] = 'ユーザー情報を削除しました。'
    redirect_to root_url
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
end
