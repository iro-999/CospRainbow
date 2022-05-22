class Public::CosplayImagesController < ApplicationController

  def new
    @cosplay_image = CosplayImage.new
  end


  def show
    @cosplay_image = CosplayImage.find(params[:id])
    @comment = Comment.new
  end

  def index
    @cosplay_images = CosplayImage.all
  end


  def create
    @cosplay_image = CosplayImage.new(cosplay_image_params)
    @cosplay_image.user_id = current_user.id
    if @cosplay_image.save
      redirect_to public_cosplay_image(@cosplay_image), notice: "You have created book successfully."
    else
      @cosplay_images = CosplayImage.all
      render 'index'
    end
  end

  private

  def cosplay_image_params
    params.require(:cosplay_image).permit(:title, :character, :image, :body)
  end

end