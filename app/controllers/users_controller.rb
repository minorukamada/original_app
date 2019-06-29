class UsersController < ApplicationController
  before_action :correct_user, only: [:edit]
  
  def index
    @users = User.order(id: :desc).page(params[:page]).per(25).search(params[:search])
    if logged_in?
      @posts = current_user.feed_posts.order(id: :desc).page(params[:page])
    else
      @post = Post.order(id: :desc).page(params[:page]).per(25)
    end
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order(id: :desc).page(params[:page])
    counts(@user)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to controller: 'sessions', action: 'new'
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end
  
  def edit 
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = '更新しました。'
      redirect_to root_url
    else
      flash.now[:danger] = '更新に失敗しました。'
      render :edit
    end
  end
  
  def followings
    @user = User.find(params[:id])
    @followings = @user.followings.page(params[:page])
    counts(@user)
  end
  
  def followers
    @user = User.find(params[:id])
    @followers = @user.followers.page(params[:page])
    counts(@user)
  end
  
  def likes
    @user = User.find(params[:id])
    @likes = @user.likes.page(params[:page]).per(10)
    counts(@user)
  end
  

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :introduction, :image)
  end
  
  def correct_user
    @user = User.find(params[:id])
    unless @user == current_user && logged_in?
      redirect_to root_url
    end
  end
end
