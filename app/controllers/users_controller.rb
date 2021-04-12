class UsersController < ApplicationController

  def index
    users = User.where.not(id: current_user.id).pluck(:id)# 自分以外のユーザー
    @users = User.find(users)
    @following_user = current_user.followings# フォロー中ユーザー
    other_unfollowed_users = User.where.not(id: [current_user.id, *current_user.following_ids])
                                 .pluck(:id)# 他のフォローしていないユーザー
    @other_unfollowed_user = User.find(other_unfollowed_users)
  end

  def show
    @user = User.find_by(name: params[:id])
    @post = @user.posts
    @post_list = @user.posts.page(params[:page]).order(created_at: :desc)
    favorites = Favorite.where(user_id: current_user.id).pluck(:post_id)
    @favorite_list = Post.find(favorites)
  end

  # フォロー0のときの案内ページ
  def firstfollow
    users = User.where.not(id: current_user.id).pluck(:id)# 自分以外のユーザー
    @users = User.find(users)
    @following_user = current_user.followings# フォロー中ユーザー
    other_unfollowed_users = User.where.not(id: [current_user.id, *current_user.following_ids])
                                 .pluck(:id)# 他のフォローしていないユーザー
    @other_unfollowed_user = User.find(other_unfollowed_users)
  end

  # 各ユーザーのフォロー中ユーザー一覧
  def following
    @user = User.find_by(name: params[:id])
    @following_users = @user.followings
    render 'following'
  end

  # 各ユーザーのフォロワーユーザー一覧
  def followers
    @user = User.find_by(name: params[:id])
    @follower_users = @user.followers
    render 'followers'
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

  private

  def user_params
    params.require(:user).permit(:name, :email, :profile_photo, :introduction, :website, :phone_number, :sex)
  end
end
