module Accounts
  class PasswordsController < ApplicationController
    before_action :authenticate_user!

    def edit; end

    def update
      if current_user.update_with_password(user_params)
        redirect_to root_path
      else
        render :edit
      end
    end

    # ホワイトパラメータのみ記載
    def user_params
      params.require(:user).permit(:password, :password_confirmation, :current_password)
    end
  end
end
