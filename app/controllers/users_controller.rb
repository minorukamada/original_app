class UsersController < ApplicationController
  # before_action :require_user_logged_in, only: [:index, :show]
  
  def index
    @users = User.order(id: :desc).page(params[:page]).per(25).search(params[:search])
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
      redirect_to @user
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
      render root_url
    end
  end
  

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
