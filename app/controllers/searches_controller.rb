class SearchesController < ApplicationController
  def search
    @user = User.search(params[:search])
    if @user.present?
      @post = @user.posts
      @post_list = @user.posts.page(params[:page]).order('updated_at DESC')
      favorites = Favorite.where(user_id: current_user.id).pluck(:post_id)
      @favorite_list = Post.find(favorites)
    end
    @hashtag = params[:search].try(:include?, "#") ?
               Hashtag.search(params[:search].delete('#')) : Hashtag.search(params[:search])
    if @hashtag.present?
      @hashtag_posts = @hashtag.posts.includes(:liked_users).page(params[:page])
                               .sort { |a, b| b.liked_users.size <=> a.liked_users.size }
      @hashtags = Hashtag.all.to_a.group_by { |hashtag| hashtag.posts.count }
      @hashtag_randoms = @hashtag.posts.order("RANDOM()").limit(1)
    elsif @user.blank? && @hashtag_posts.blank?
      redirect_to root_path(current_user)
      flash[:alert] = "検索結果が見つかりませんでした"
    end
  end
end
