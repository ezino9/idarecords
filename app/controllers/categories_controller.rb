class CategoriesController < ApplicationController

  before_action :authenticate_user!, only: [:edit, :update, :index, :new, :destory]
 
  def show
    @category = Category.find(params[:id])
    @posts = @category.posts.all
  end

end
