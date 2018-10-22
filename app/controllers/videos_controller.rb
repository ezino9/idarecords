class VideosController < ApplicationController

  before_action :authenticate_user!, only: [:edit, :new, :create, :update, :destory]
  before_action :index, only: [:index, :show]
  def new
    @video = Video.new
  end

  def create
    @video = Video.new(video_params)
    if @video.save 
      redirect_to videos_path, :notice => 'Video published'
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def index
    if params[:search]
      @videos = Video.search(params[:search]).all.order('created_at DESC').paginate(:per_page => 15, :page => params[:page])
      @categories = Category.all
      @related = Video.where("category_id = #{params[:id]}").order('created_at DESC').paginate(:per_page => 10, :page => params[:page])
    
    else
      @videos = Video.all.order('created_at DESC').paginate(:per_page => 15, :page => params[:page])
      @categories = Category.all
      @related = Video.where("category_id = #{params[:id]}").order('created_at DESC').paginate(:per_page => 10, :page => params[:page])
    end
  end

  def show
    @video = Video.find(params[:id])
  end

  def destroy
  end

  private
  def video_params
    params.require(:video).permit(:song_title, :singer_name, :rabel_name, :category_id, :user_id, :youtube_link)
  end
end
