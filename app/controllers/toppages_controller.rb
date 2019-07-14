class ToppagesController < ApplicationController
  def index
    @posts_header = Post.includes(:user).order(id: :desc).limit(4)
    @posts = Post.includes(:user).order(id: :desc).page(params[:post_page]).per(10)
    @users = User.includes(:posts).order(id: :desc).page(params[:user_page]).per(5)
  end
end
