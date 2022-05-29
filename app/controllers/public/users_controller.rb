class Public::UsersController < ApplicationController

  before_action :ensure_user, only: [:edit, :update, :destroy]

  def index
    @users = User.all.order(id: "DESC").page(params[:page]).per(10)
  end

  def show
    @user = User.find(params[:id])
    @cosplay_images = @user.cosplay_images.page(params[:page])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to public_user_path(@user), notice: "You have updated user successfully."
    else
      render :edit
    end
  end

  def unsubscribe
    @user = current_user
    @user.update(is_active: false)
    sign_out
    flash[:notice] = "withdraw"
    redirect_to public_root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end

  def ensure_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to public_user_path(current_user)
    end
  end

end
