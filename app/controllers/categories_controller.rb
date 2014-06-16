# encoding: UTF-8

# categories controller
class CategoriesController < ApplicationController
  def new
    @category = Category.new
  end

  def create
    # @post = Post.find(params[:post_id])
    @category = Category.new(category_params)

    if @category.save
      flash[:notice] = 'Your category was added.'
      redirect_to root_path
    else
      render :new # this is a template file
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
