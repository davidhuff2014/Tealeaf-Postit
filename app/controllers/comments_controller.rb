# encoding: UTF-8

# comments controller
class CommentsController < ApplicationController
  before_action :require_user
  before_action :set_post
  
  def create
    # @post = Post.find(params[:post_id])
    # @post = Post.find(params[:post_id], params[:user_id])

    # @post.creator = User.first  # TODO: only until we have authentication
    # @comment = Comment.new(params.require(:comment).permit(:body))
    @comment = @post.comments.build(params.require(:comment).permit(:body))
    @comment.creator = current_user

    if @comment.save
      # flash[:notice] = 'Your comment was added.'
      # redirect_to posts_path(@post)
      # doing it all in one
      redirect_to :back, notice: 'Your comment was added.'
    else
      @post.reload
      render 'posts/show' # this is a template file
    end
  end

  def vote
    @comment = Comment.find(params[:id])

    @vote = Vote.create(voteable: @comment, creator: current_user, vote: params[:vote])

    respond_to do |format|
      format.html do
        if @vote.valid?
          # flash[:notice] = "#{@post.creator.username}, your vote was counted."
          flash[:notice] = "#{@current_user.username}, your vote was counted."
        else
          flash[:error] = "#{@current_user.username}, you can only vote for the \"#{@comment.body}\" comment one time."
        end
        redirect_to :back
      end
      format.js
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end
end
