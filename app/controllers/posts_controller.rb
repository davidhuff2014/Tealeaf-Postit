# encoding: UTF-8

# posts controller
class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :vote]
  before_action :require_user, except: [:index, :show]
  # 1. set up instance varialbe for action
  # 2. redirect based on some condition

  def index
    @posts = Post.all
  end

  def show
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.creator = current_user

    if @post.save
      flash[:notice] = 'Your post was created.'
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit  
    # this is all my code!
    if current_user == @post.creator
      flash[:notice] = 'You are allowed to edit this post.'
    else
      flash[:alert] = 'You are not the creator of this post and cannot edit it.'
      redirect_to posts_path
    end
  end

  def update
    if @post.update(post_params)
      flash[:notice] = 'The post was updated.'
      redirect_to posts_path
    else
      render :edit
    end
  end

  def vote
    @vote = Vote.create(voteable: @post, creator: current_user, vote: params[:vote])

    if @vote.valid?
      flash[:notice] = 'Your vote was counted.'
    else
      flash[:notice] = 'Your vote was  not counted.'
    end

    redirect_to :back
  end

  private

  def post_params
    params.require(:post).permit(:title, :url, :description, category_ids: [])
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
