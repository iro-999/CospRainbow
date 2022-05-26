class Public::FavoritesController < ApplicationController

  def create
    cosplay_image = CosplayImage.find(params[:cosplay_image_id])
    favorite = current_user.favorites.new(cosplay_image_id: cosplay_image.id)
    favorite.save
    redirect_to public_cosplay_image_path(cosplay_image)
  end

  def destroy
    cosplay_image = CosplayImage.find(params[:cosplay_image_id])
    favorite = current_user.favorites.find_by(cosplay_image_id: cosplay_image.id)
    favorite.destroy
    redirect_to public_cosplay_image_path(cosplay_image)
  end

end
