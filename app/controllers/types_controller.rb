class TypesController < ApplicationController

  before_action :authenticate_user!, only: [:edit, :update, :index, :new, :destory]

  def show
    @type = Type.find(params[:id])
    @videos = @type.videos.all.order('created_at DESC').page(params[:page]).per(20)
    @audios = @type.audios.all.order('created_at DESC').page(params[:page]).per(20)
  end
end
