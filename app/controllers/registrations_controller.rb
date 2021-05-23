class RegistrationsController < Devise::RegistrationsController
  before_action :ensure_normal_user, only: %i[update destroy]

  # ログイン後、遷移
  def after_sign_up_path_for(_resource)
    user_path(current_user)
  end

  # プロフィール更新後、遷移
  def after_update_path_for(_resource)
    user_path(current_user)
  end

  # ゲストユーザーのパスワード変更・アカウント削除不可
  def ensure_normal_user
    if resource.email == 'guest@example.com'
      redirect_to root_path, alert: 'ゲストユーザーの更新・削除はできません。'
    end
  end

  protected

  def update_resource(resource, params)
    resource.update_without_current_password(params)
  end
end
