class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: %i(show destroy)

  def index
    @posts = Post.includes(:photos, :user).where(user_id: [current_user.id, *current_user.following_ids])
                 .page(params[:page]).per(10).order('created_at DESC')# フォロー中ユーザーの投稿
    @following_user = current_user.followings# フォロー中ユーザー
  end

  def show
    @post = Post.find_by(id: params[:id])
    @user = @post.user
    @post_list = @user.posts.page(params[:page]).order(created_at: :desc)
    respond_to do |format|
      format.html # show.html.erb
      format.js # show.js.erbから_show.html.erbへ
    end
  end

  def new
    @post = Post.new
    @post.photos.build
  end

  def create
    @post = Post.new(post_params)
    if @post.photos.present?
      @post.save
      redirect_to post_path(@post)
      flash[:notice] = "投稿が保存されました"
    else
      redirect_to root_path
      flash[:alert] = "投稿に失敗しました"
    end
  end

  def destroy
    if @post.user == current_user
      flash[:notice] = "投稿が削除されました" if @post.destroy
    else
      flash[:alert] = "投稿の削除に失敗しました"
    end
    redirect_to root_path
  end

  def hashtag
    @user = current_user
    if params[:name].nil?
      @hashtags = Hashtag.all.to_a.group_by{ |hashtag| hashtag.posts.count}
    else
      @hashtag = Hashtag.find_by(hashname: params[:name])
      @hashtag_posts = @hashtag.posts.includes(:liked_users).page(params[:page]).sort {|a,b| b.liked_users.size <=> a.liked_users.size}
      @hashtags = Hashtag.all.to_a.group_by{ |hashtag| hashtag.posts.count}
      @hashtag_randoms = @hashtag.posts.order("RANDOM()").limit(1)
    end
  end

  private

  def post_params
    params.require(:post).permit(:caption, :hashword, :hashtag_ids, photos_attributes: [:image]).merge(user_id: current_user.id)
  end

  def set_post
    @post = Post.find_by(id: params[:id])
  end
end
