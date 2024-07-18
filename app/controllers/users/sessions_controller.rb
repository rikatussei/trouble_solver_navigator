# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

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

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
# app/controllers/users/sessions_controller.rb

  def destroy
    # ログアウト前のユーザー情報
    logger.debug "Before sign out: current_user = #{current_user.inspect}"

    # ログアウト処理
    signed_out = sign_out(current_user)

    # ログアウト後のユーザー情報と結果
    logger.debug "After sign out: current_user = #{current_user.inspect}, signed_out = #{signed_out}"

    # リダイレクト
    respond_to_on_destroy
  end
  
end

