class ToppagesController < ApplicationController
  def index
    # if logged_in?
      @posts = Post.order(id: :desc).page(params[:page]).per(25)
      @users = User.order(id: :desc).page(params[:page]).per(25)
    # end
  end
end
