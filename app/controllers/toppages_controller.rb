class ToppagesController < ApplicationController
  def index
    @posts_header = Post.includes(:user).order(id: :desc).limit(4)
    @users = User.includes(:posts).order(id: :desc).page(params[:user_page]).per(5)
    @posts = Post.find(Favorite.group(:post_id).order('count(post_id) desc').limit(5).pluck(:post_id))
  end
end
