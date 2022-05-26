class Public::CosplayImagesController < ApplicationController

  def new
    @cosplay_image = CosplayImage.new
  end


  def show
    @cosplay_image = CosplayImage.find(params[:id])
    @comment = Comment.new
  end

  def index
    @cosplay_images = CosplayImage.order(id: "DESC")
  end

  def edit
    @cosplay_image = CosplayImage.find(params[:id])
    if @cosplay_image.user == current_user
      render "edit"
    else
      redirect_to public_cosplay_images_path
    end
  end

  def update
    @cosplay_image = CosplayImage.find(params[:id])
    if @cosplay_image.update(cosplay_image_params)
      redirect_to public_cosplay_image_path(@cosplay_image), notice: "You have updated book successfully."
    else
      render "edit"
    end
  end

  def create
    @cosplay_image = CosplayImage.new(cosplay_image_params)
    @cosplay_image.user_id = current_user.id
    if @cosplay_image.save
      redirect_to public_cosplay_image_path(@cosplay_image), notice: "You have created cosplay image successfully."
    else
      @cosplay_images = CosplayImage.all
      render 'index'
    end
  end

  def destroy
    @cosplay_image = CosplayImage.find(params[:id])
    @cosplay_image.destroy
    redirect_to public_cosplay_images_path
  end

  private

  def cosplay_image_params
    params.require(:cosplay_image).permit(:title, :character, :image, :body)
  end

end