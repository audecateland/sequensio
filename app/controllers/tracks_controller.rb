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
end
