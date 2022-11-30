class Public::CategoriesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @category = Category.new
    @categories = current_user.categories
  end
  
  def create
    @category = Category.new(category_params)
    @category.user_id = current_user.id
    @categories = current_user.categories
    @category.save
    redirect_to categories_path
  end
  
  def edit
    @category = Category.find(params[:id])
  end
  
  def update
    @category = Category.find(params[:id])
    @category.update(category_params)
    redirect_to categories_path(@category.id)
  end
  
  private
  
  def category_params
    params.require(:category).permit(:user_id, :category_name)
  end
end
