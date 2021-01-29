class RegistrationsController < Devise::RegistrationsController

  # ログイン後、偏移
  def after_sign_up_path_for(resource)
    user_path(current_user)
  end

  # プロフィール更新後、偏移
  def after_update_path_for(resource)
    user_path(current_user)
  end

  protected

    def update_resource(resource, params)
      resource.update_without_current_password(params)
    end

end
