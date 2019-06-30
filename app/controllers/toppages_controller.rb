class ToppagesController < ApplicationController
  def index
    @posts_header = Post.includes(:user).order("RAND()").page(params[:page]).per(4)
    @posts = Post.includes(:user).order(id: :desc).page(params[:post_page]).per(20)
    @users = User.includes(:posts).order(id: :desc).page(params[:user_page]).per(5)
  end
end
