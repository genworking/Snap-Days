class RegistrationsController < Devise::RegistrationsController



  # ログイン後、表示
  def after_sign_up_path_for(resource)
    user_path(current_user)
  end

  def after_update_path_for(resource)
    user_path(current_user)
  end

  # 退会処理
  def destroy
    @user = User.find_by(name: params[:name])
    @user.destroy
    redirect_to root_path
    flash[:notice] = "退会しました"
  end


  protected

    def update_resource(resource, params)
      resource.update_without_current_password(params)
    end

end
