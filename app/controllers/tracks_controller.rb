class TracksController < ApplicationController
  def index
    @tracks = Track.all
  end

  def update
    @tracks = Track.find(params[:id])
    @track.update(params[:track])
  end

  def shuffle
    # on retrouve la sequence concernée
    @track = Track.find(params[:format])
    @track.shuffle_all_tracks
    redirect_to music_session_path(@track.sequence)
  end
end
