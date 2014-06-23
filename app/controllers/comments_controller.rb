# encoding: UTF-8

# comments controller
class CommentsController < ApplicationController
  before_action :require_user
  
  def create
    @post = Post.find(params[:post_id])
    # @post = Post.find(params[:post_id], params[:user_id])

    # @post.creator = User.first  # TODO: only until we have authentication
    # @comment = Comment.new(params.require(:comment).permit(:body))
    @comment = @post.comments.build(params.require(:comment).permit(:body))
    @comment.creator = current_user

    if @comment.save
      # flash[:notice] = 'Your comment was added.'
      # redirect_to posts_path(@post)
      # doing it all in one
      redirect_to posts_path(@post), notice: 'Your comment was added.'
    else
      @post.reload
      render 'posts/show' # this is a template file
    end
  end
end
