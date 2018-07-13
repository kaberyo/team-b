class CommentsController < ApplicationController
  def create
    Comment.create(text: comment_params[:text], prototype_id: comment_params[:prototype_id], user_id: current_user.id)
    redirect_to prototype_path(params[:prototype_id])
  end

  def destroy
    comment = Comment.find(params[:id])
    if comment.user_id == current_user.id
      comment.destroy
    end
    redirect_to prototype_path(params[:prototype_id])
  end

  private
  def comment_params
    params.permit(:text, :prototype_id)
  end



end
