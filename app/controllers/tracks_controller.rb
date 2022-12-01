class TracksController < ApplicationController
  def index
    @tracks = Track.all
  end

  def update
    @tracks = Track.find(params[:id])
    @track.update(params[:track])
  end
end
