class CommentsController < ApplicationController
  def create
    comment = Comment.create(comment_params)
    redirect_to "/cooks/#{comment.cook.id}"
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, cook_id: params[:cook_id])
  end
end
