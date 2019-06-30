class ToppagesController < ApplicationController
  def index
    @posts = Post.includes(:user).includes(favorites: :user).order(id: :desc).page(params[:page]).per(4)
    @users = User.includes(:posts).order(id: :desc).page(params[:page]).per(5)
  end
end
