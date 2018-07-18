class CommentsController < ApplicationController
  def create
    if user_signed_in?
      Comment.create(text: comment_params[:text], prototype_id: comment_params[:prototype_id], user_id: current_user.id)
      redirect_to prototype_path(params[:prototype_id])
    else
      redirect_to "/users/sign_in", method: :get
    end
  end
  def destroy
    comment = Comment.find(params[:id])
    if comment.user_id == current_user.id
      comment.destroy
    end
    redirect_to prototype_path(params[:prototype_id])
  end

  def edit
    @comment = Comment.find(params[:id])
    @prototype = Prototype.find(params[:prototype_id])
    @comments = @prototype.comments.includes(:user)
  end

  def update
    comment = Comment.find(params[:id])
    if comment.user_id == current_user.id
      comment.update(comment_params)
    end
    redirect_to prototype_path(params[:prototype_id])
  end

  private
  def comment_params
    params.permit(:text, :prototype_id)
  end



end
