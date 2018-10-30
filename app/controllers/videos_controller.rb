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
    @video = Video.find(params[:id])
  end

  def update
    @video = Video.find(params[:id])
    if @video.update(video_params)
      redirect_to video_path(@video), notice: 'All changes have been saved'
    else
      render 'edit'
    end
  end

  def index
    if params[:search]
      @videos = Video.search(params[:search]).all.order('created_at DESC')
      @types = Type.all
    
    else
      @videos = Video.all.order('created_at DESC')
      @types = Type.all
    end
  end

  def show
    @video = Video.find(params[:id])
  end

  def destroy
  end

  private
  def video_params
    params.require(:video).permit(:song_title, :singer_name, :rabel_name, :type_id, :user_id, :youtube_link)
  end
end
