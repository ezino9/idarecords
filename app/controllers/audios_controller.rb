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
    @audio = Audio.find(params[:id])
  end

  def update
    @audio = Audio.find(params[:id])
    if @audio.update(audio_params)
      redirect_to audio_path(@audio), notice: 'All changes have been saved'
    else
      render 'edit'
    end
  end

  def index
    if params[:search]
      @audios = Audio.search(params[:search]).all.order('created_at DESC').page(params[:page]).per(20)
      @types = Type.all

    else
      @audios = Audio.all.order('created_at DESC').page(params[:page]).per(20)
      @types = Type.all
    end
  end

  def show
    @audio = Audio.find(params[:id])
  end

  def destroy
  end
  private def audio_params
    params.require(:audio).permit(:title, :coverpicture, :artist, :user_id, :label, :type_id,   :song_audio)
  end
end
