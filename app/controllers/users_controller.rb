# encoding: UTF-8

# Users controller
class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  # before_action :require_user, except: [:new, :create, :show]
  before_action :require_same_user, only: [:edit, :update]

  def admin
    render :admin
  end

  def new
    @user = User.new
  end

  def show
    # binding.pry
    # @user = User.find(params[:id])
    # @posts = @user.posts
    # @comments = @Comments.find(params[:id])
    # have to have the following line for my setup
    # @post = Post.find_by slug: params[:id]
  end

  def create
    @user = User.new(user_params)

    if @user.save
      # flash[:notice] = 'You are registered.'
      session[:user_id] = @user.id # extra credit
      flash[:notice] = "Welcome, #{@user.username} you are now registered and logged in!"
      # render :admin # only used to force admin script to run
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    # @user = User.find(params[:id])
    # render :new
        # this is all my code!
        # binding.pry
    # no longer need because of before_action require_same_user
    # if current_user.id == @user.id
    #   flash[:notice] = 'You are allowed to edit this user.'
    # else
    #   flash[:alert] = 'You are not the creator of this user and cannot edit it.'
    #   redirect_to posts_path
    # end
  end

  def update
    # @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = 'Profile has been updated.'
      redirect_to user_path(@user)
    else
      render :edit
    end    
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :time_zone)
  end

  def set_user
    @user = User.find_by slug: params[:id]
  end

  def require_same_user
    if current_user != @user || logged_in? && current_user.admin?
      flash[:error] = 'You do not have authorization to perform this action'
      redirect_to root_path
    end
  end
end
