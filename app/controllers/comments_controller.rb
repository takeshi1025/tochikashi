class CommentsController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    @tochi = Tochi.find(params[:tochi_id])
    @comment = @tochi.comments.build(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    render :index
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    render :index
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:content, :tochi_id, :user_id)
  end
  
end
