# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :reject_user, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected
  def after_sign_in_path_for(resource)
    public_root_path
  end


  def after_sign_out_path_for(resource)
    public_root_path
  end


  def reject_user
    @user = User.find_by(email: params[:user][:email].downcase)
    if @user

      if (@user.valid_password?(params[:user][:password]) && (@user.active_for_authentication? == false))
        flash[:alert] = "退会済みです"
        redirect_to new_user_session_path
      elsif @user.valid_password?(params[:user][:password]) != true
        flash[:alert] = "パスワードが正しくありません"
      end


    else
      flash[:alert] = "有効なメールアドレスではありません"
    end

  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
