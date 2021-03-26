class UsersController < ApplicationController

  def show
    @user = User.find_by(name: params[:id])
    @posts = @user.posts
    @post_list = @user.posts.page(params[:page]).order(created_at: :desc)
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

  # フォローユーザー一覧
  def following
    @user = User.find_by(name: params[:name])
    following_users = Relationship.where.not(following_id: current_user.id).pluck(:following_id)
    @following_user = User.find(following_users)
    render 'following'
  end

  # フォロワーユーザー一覧
  def followers
    @user = User.find_by(name: params[:name])
    follower_users = Relationship.where.not(follower_id: current_user.id).pluck(:follower_id)
    @follower_user = User.find(follower_users)
    render 'followers'
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :profile_photo, :introduction, :website, :phone_number, :sex)
  end
end
