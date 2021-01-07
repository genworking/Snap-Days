class UsersController < ApplicationController

  def show
    @user = User.find_by(id: params[:id])
  end

  # 退会確認ページ
  def unsubscribe
    @user = User.find_by(name: params[:name])
  end

  # フォロー
  def following
      @user  = User.find(params[:id])
      @users = @user.followings
      render 'show_follow'
  end

  # フォロワー
  def followers
    @user  = User.find(params[:id])
    @users = @user.followers
    render 'show_follower'
  end

end
