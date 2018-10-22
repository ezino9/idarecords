class CategoriesController < ApplicationController

  before_action :authenticate_user!, only: [:edit, :new, :create, :update, :destory]
  def new
    @category = Category.new

  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path, :notice => 'Category created!'
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def index
    @categories = Category.all
  end

  def show
  end

  def destroy
  end
  private
  def category_params
    params.require(:category).permit(:post, :song)
  end
end
