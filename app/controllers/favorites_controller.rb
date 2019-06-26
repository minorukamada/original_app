class FavoritesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @favorite_id = params[:post_id]
    current_user.like(@post)
    # flash[:success] = 'ブックマークしました。'
    # redirect_back(fallback_location: root_url)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @favorite_id = @post.id
    current_user.unlike(@post)
    # flash[:success] = 'ブックマークを解除しました。'
    # redirect_back(fallback_location: root_url)
  end
end
