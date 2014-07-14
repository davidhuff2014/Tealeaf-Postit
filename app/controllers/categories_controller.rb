# encoding: UTF-8

# categories controller
class CategoriesController < ApplicationController
  before_action :require_user, except: [:show]
  before_action :require_admin, except: [:show]

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      flash[:notice] = 'Your category was added.'
      redirect_to root_path
    else
      render :new # this is a template file
    end
  end

  def show
    @category = Category.find_by slug: params[:id]
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
