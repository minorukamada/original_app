class RelationshipsController < ApplicationController
  before_action :require_user_logged_in

  def create
    @user = User.find(params[:follow_id])
    @follow_id = params[:follow_id]
    current_user.follow(@user)
  end

  def destroy
    @user = User.find(params[:follow_id])
    @follow_id = params[:follow_id]
    current_user.unfollow(@user)
  end
end
