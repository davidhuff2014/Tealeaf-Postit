# encoding: UTF-8

# comments controller
class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(params.require(:comment).permit(:body))

    if @comment.save
      flash[:notice] = 'Your comment was added.'
      redirect_to posts_path(@post)
    else
      render 'posts/show' # this is a template file
    end
  end
end
