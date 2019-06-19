class ToppagesController < ApplicationController
  def index
    # if logged_in?
      @posts = Post.order(id: :desc).page(params[:page]).per(10)
      @users = User.order(id: :desc).page(params[:page]).per(5)
    # end
  end
end
