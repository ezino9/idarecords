class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :new, :create, :update, :destory]
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save 
      redirect_to posts_path, :notice => 'Post Published!'
    else
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post), notice: 'All changes have been saved'
    else
      render 'edit'
    end
  end

  def index
    if params[:search]
      @posts = Post.search(params[:search]).all.order('created_at DESC')
      @categories = Category.all
    else
      @posts = Post.all.order('created_at DESC')
      @categories = Category.all
    end
  end

  def show
  @post = Post.find(params[:id])
  end

  def destroy
  end

  private
  def post_params
    params.require(:post).permit(:title, :body, :coverpicture, :category_id, :user_id)
  end
end
