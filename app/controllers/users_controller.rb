class UsersController < ApplicationController

  def show
    @user = User.find_by(name: params[:id])
  end

  # パスワード変更ページ
  def mypassword
    @user = User.find_by(name: params[:name])
  end

  # 退会確認ページ
  def unsubscribe
    @user = User.find_by(name: params[:name])
  end

  # 退会処理
  def destroy
    @user = User.find_by(name: params[:name])
    @user.destroy
    redirect_to root_path
  end

  # フォロー
  def following
    @user  = User.find_by(id: params[:name])
    @user = @user.followings
    render 'show_follow'
  end

  # フォロワー
  def followers
    @user  = User.find_by(id: params[:name])
    @user = @user.followers
    render 'show_follower'
  end

end
