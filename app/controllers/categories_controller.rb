# encoding: UTF-8

# categories controller
class CategoriesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @category = Category.new(params.require(:category).permit(:name))

    if @category.save
      flash[:notice] = 'Your category was added.'
      redirect_to posts_path(@post)
    else
      render :new # this is a template file
    end
  end
end
