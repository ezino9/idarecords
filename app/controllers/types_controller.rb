class TypesController < ApplicationController
  def show
    @type = Type.find(params[:id])
    @videos = @type.videos.all.order('created_at DESC').page(params[:page]).per(1)
    @audios = @type.audios.all.order('created_at DESC').page(params[:page]).per(1)
  end
end
