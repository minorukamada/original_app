class FavoritesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @favorite_id = params[:post_id]
    current_user.like(@post)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @favorite_id = @post.id
    current_user.unlike(@post)
  end
end
