class UsersController < ApplicationController

  def show
    @user = User.find_by(name: params[:id])
    @posts = @user.posts
    favorites = Favorite.where(user_id: current_user.id).pluck(:post_id)
    @favorite_list = Post.find(favorites)
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

  private

  def user_params
    params.require(:user).permit(:name, :email, :profile_photo)
  end
end
