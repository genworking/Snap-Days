class SearchController < ApplicationController
  def search
    @user = User.search(params[:search])
    @hashtag = params[:search].try(:include?, "#") ? Hashtag.find_by(hashname: params[:search].delete('#')) : Hashtag.find_by(hashname: params[:search])
    if @hashtag.present?
      @hashtag_posts = @hashtag.posts.page(params[:page]).per(21).reverse_order
      @hashtags = Hashtag.all.to_a.group_by{ |hashtag| hashtag.posts.count}
    else
    end
  end
end
