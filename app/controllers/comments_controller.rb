class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end

  end

  def destroy
    @comment = Comment.find_by(id: params[:id],text_id: params[:text_id])
    @comment.destroy
    redirect_back(fallback_location: root_path)
  end

  private
  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, text_id: params[:text_id])
  end

end
