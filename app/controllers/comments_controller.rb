class CommentsController < ApplicationController
  before_action :require_user_logged_in
  before_action :comment_author, only: [:destroy]
  
  def create
    @comment = current_user.comments.build(comment_params)
    @task = Task.find(params[:task_id])
    @comment.task = @task
    
    if @comment.save
      flash[:success] = 'コメントを投稿しました。'
      redirect_back(fallback_location: root_url)
    else
      flash[:danger] = 'コメントの投稿に失敗しました。'
      redirect_back(fallback_location: root_url)
    end
  end

  def destroy
    @comment.destroy
    flash[:success] = 'コメントを削除しました。'
    redirect_back(fallback_location: root_url)
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:content)
  end
  
  def comment_author
    @comment = current_user.comments.find_by(id: params[:id])
    unless @comment
      redirect_to root_url
    end
  end
  
end
