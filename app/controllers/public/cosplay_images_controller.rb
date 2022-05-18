class Public::CosplayImagesController < ApplicationController
  
  def new
    @cosplay_image = CosplayImage.new
  end
  
  def show
    @cosplay_image = CosplayImage.find(params[:id])
    @comment = Comment.new
  end
  
end
