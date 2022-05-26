class Public::CommentsController < ApplicationController

  def create
    cosplay_image = CosplayImage.find(params[:cosplay_image_id])
    comment = current_user.comments.new(comment_params)
    comment.cosplay_image_id = cosplay_image.id
    comment.save
    redirect_to public_cosplay_image_path(cosplay_image)
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to public_cosplay_image_path(params[:cosplay_image_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
