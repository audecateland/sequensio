class TracksController < ApplicationController
  def index
    @tracks = Track.all
  end

  def update
    @track = Track.find(params[:id])
    @track.update(track_params)
    render json: @track
  end

  private

  def track_params
    params.require(:track).permit(:position)
  end

  def shuffle
    # on retrouve la sequence concernée
    @track = Track.find(params[:format])
    @track.shuffle_all_tracks
    redirect_to music_session_path(@track.sequence)
  end
end
