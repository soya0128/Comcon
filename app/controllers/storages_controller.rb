class StoragesController < ApplicationController

  def index
    @storages = Storage.includes(:storage).order("created_at DESC")
  end
end
