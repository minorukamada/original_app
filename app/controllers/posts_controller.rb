class PostsController < ApplicationController
  # before_action :require_user_logged_in
  before_action :correct_user, only: [:edit, :update, :destroy]
  
  def index
    @posts = Post.order(id: :desc).page(params[:page]).per(10).search(params[:search])
  end
  
  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.order(id: :desc)
    @comment = Comment.new
    @likes_count = Favorite.where(post_id: @post.id).count
    @comments_count = Comment.where(post_id: @post.id).count
  end
  
  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = 'メッセージを投稿しました。'
      redirect_to root_url
    else
      @posts = current_user.posts.order(id: :desc).page(params[:page])
      flash.now[:danger] = 'メッセージの投稿に失敗しました。'
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    if @post.update(post_params)
      flash[:success] = '更新しました。'
      redirect_to root_url
    else
      flash.now[:danger] = '更新に失敗しました。'
      render :edit
    end
  end


  def destroy
    @deleted_post_id = @post.id
    @post.destroy
    # flash[:success] = 'メッセージを削除しました。'
    # redirect_to root_url
  end
  
  def timeline
    @user = current_user
    @posts = @user.feed_posts.order(id: :desc).page(params[:page]).per(100)
  end
  
  def ranking
    @posts = Post.find(Favorite.group(:post_id).order('count(post_id) desc').limit(10).pluck(:post_id))
  end
  

  private

  def post_params
    params.require(:post).permit(:title, :content, :category, :image, :remove_image)
  end
  
  def correct_user
    @post = current_user.posts.find_by(id: params[:id])
    unless @post && logged_in?
      redirect_to root_url
    end
  end
end
