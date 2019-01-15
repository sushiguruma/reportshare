class TasksController < ApplicationController
  before_action :require_user_logged_in
  before_action :task_author, only: [:edit, :update, :destroy]
  
  def show
    @task = Task.find(params[:id])
  end

  def new
    @theme = Theme.find(params[:theme_id])
    @task = current_user.tasks.new
  end

  def create
    @theme = Theme.find(params[:theme_id])
    @task = current_user.tasks.build(task_params)
    @task.theme = @theme
    
    if @task.save
      flash[:success] = '報告内容を投稿しました。'
      redirect_to task_path(@task)
    else
      flash[:danger] = '投稿に失敗しました。'
      render :new
    end
  end

  def edit
    
  end

  def update
    
    if @task.update(task_params)
      flash[:success] = '報告内容を更新しました。'
      redirect_to task_path(@task)
    else
      flash[:danger] = '更新に失敗しました。'
      render :new
    end
  end

  def destroy
    @task.destory
    flash[:success] = '投稿内容を消去しました。'
    redirect_to root_url
  end
  
  private
  
  def task_params
    params.require(:task).permit(:title, :overview, :objective, :method, :result)
  end
  
  def task_author
    @task = current_user.tasks.find_by(id: params[:id])
    unless @task
      redirect_to root_url
    end
  end
  
end
