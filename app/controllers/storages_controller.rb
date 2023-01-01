class StoragesController < ApplicationController

  def index
    @storages = Storages.includes(:storage).order("created_at DESC")
  end
end
