class AudiosController < ApplicationController

  before_action :authenticate_user!, only: [:edit, :new, :create, :update, :destory]
  before_action :index
  def new
    @audio = Audio.new
  end

  def create
    @audio = Audio.new(audio_params)
    if @audio.save
      redirect_to audios_path :notice => "Audio published!"
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
      @audios = Audio.search(params[:search]).all.order('created_at DESC').paginate(:per_page => 15, :page => params[:page])
      @categories = Category.all
      @related = Audio.where("category_id = #{params[:id]}").order('created_at DESC').paginate(:per_page => 10, :page => params[:page])

    else
      @audios = Audio.all.order('created_at DESC').paginate(:per_page => 15, :page => params[:page])
      @categories = Category.all
      @related = Audio.where("category_id = #{params[:id]}").order('created_at DESC').paginate(:per_page => 10, :page => params[:page])

    end
  end

  def show
    @audio = Audio.find(params[:id])
  end

  def destroy
  end
  private def audio_params
    params.require(:audio).permit(:title, :coverpicture,:artist, :user_id, :label, :category_id,   :song_audio)
  end
end
