# encoding: UTF-8

# posts controller
class PostsController < ApplicationController
  def index

  end
  def show
    @post = Post.find(params[:id])
  end
end
