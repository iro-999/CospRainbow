class Public::CosplayImagesController < ApplicationController

  def new
    @cosplay_image = CosplayImage.new
  end


  def show
    @cosplay_image = CosplayImage.find(params[:id])
    @tags = @cosplay_image.tags
    @comment = Comment.new
  end

  def index
    @cosplay_images = CosplayImage.order(id: "DESC").page(params[:page]).per(10)
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
      tags = Vision.get_image_data(@cosplay_image.image)
      tags.each do |tag|
        
        @cosplay_image.tags.create(name: tag)
      end
      redirect_to public_cosplay_image_path(@cosplay_image), notice: "You have created cosplay image successfully."
    else
      @cosplay_images = CosplayImage.all
      render 'new'
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