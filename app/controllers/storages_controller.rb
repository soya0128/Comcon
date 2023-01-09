class StoragesController < ApplicationController

  def index
    @storages = Storage.includes(:user).order("created_at DESC")
  end

  def new
    @storage = Storage.new
  end

  def create
    @storage = Storage.new(storage_params)
    if @storage.save
      redirect_to storages_path
    else
      render :new
    end
  end

  def destroy
    storage = Storage.find(params[:id])
    storage.destroy
    redirect_to storages_path
  end

  private
  def storage_params
    params.require(:storage).permit(:image,:name).merge(user_id: current_user.id)
  end
end
