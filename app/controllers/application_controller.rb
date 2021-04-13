class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception # クロスサイトフォージェリ対策
  before_action :configure_permitted_parameters, if: :devise_controller?# deviseコントローラーにストロングパラメータを追加

  def after_sign_in_path_for(resource)
    user_path(resource)
  end

  protected
  # フォーム必須項目（:email,:passwordは標準）
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:username])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :username, :profile_photo, :introduction,
                                      :website, :phone_number, :sex])
  end
end
