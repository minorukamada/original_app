class CommentsController < ApplicationController
  def new
    @post = current_user.comments.build
  end
  
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_back(fallback_location: root_path)
    else
      render template: "posts/show"
    end

  end
  

  private
  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id)
  end
end
