# encoding: UTF-8

# posts controller
class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :vote]
  before_action :require_user, except: [:index, :show]
  before_action :require_creator, only: [:edit, :update]
  # 1. set up instance varialbe for action
  # 2. redirect based on some condition

  def index
    # @posts = Post.all
    # alternate to sort by votes desc
    @posts = Post.all.sort_by { |x| x.total_votes }.reverse

    # exposes API
    # respond_to do |format|
      # http://localhost:3000/posts.html
      # format.html # default display

      # http://localhost:3000/posts.json
      # format.json # this one uses index.json.jbuilder

      # http://localhost:3000/posts.json
      # format.json { render json: @posts } # renders all

      # http://localhost:3000/posts.xml
      # format.xml { render xml: @posts } # renders all
    # end
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
    if current_user == @post.creator || logged_in? && current_user.admin?
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

    respond_to do |format|
      format.html do
        if @vote.valid?
          flash[:notice] = "#{@current_user.username}, your vote was counted."
        else
          flash[:error] = "#{@current_user.username}, you can only vote for the \"#{@post.title}\" post one time."
        end
        redirect_to :back
      end
      format.js
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :url, :description, category_ids: [])
  end

  def set_post
    @post = Post.find_by slug: params[:id]
  end

  def require_creator
    access_denied unless logged_in? && current_user == @post.creator || logged_in? && current_user.admin?
  end
end
