class UsersController < ApplicationController

  def index
    @current_user = current_user
    users = User.where.not(id: current_user.id).pluck(:id)# 自分以外のユーザー
    @users = User.find(users)# フォロー0人ページ用
    @following_user = @current_user.followings.page(params[:page]).order(updated_at: :desc)# フォロー中ユーザー
    other_unfollowed_users = Relationship.where.not(following_id: current_user.followings)
                                         .pluck(:following_id)# 他のフォローしていないユーザー
    @other_unfollowed_user = User.find(other_unfollowed_users)# フォロー1人以上ページ用
  end

  def show
    @user = User.find_by(name: params[:id])
    @post = @user.posts
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
