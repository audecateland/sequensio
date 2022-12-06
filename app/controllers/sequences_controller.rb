class SequencesController < ApplicationController
  def edit
  end

  def update
    raise
  end

  def shuffle
    # on retrouve la sequence concernée
    @sequence = Sequence.find(params[:id])
    @sequence.shuffle_all_tracks
    redirect_to music_session_path(@sequence.music_session)
  end

  def new
    # @playlists = ApiService.new().playlists
    @sequence = Sequence.new
    @music_session = MusicSession.find(params[:music_session_id])
  end

  def create
    @sequence = Sequence.new(sequence_params)
    @music_session = MusicSession.find(params[:music_session_id])
    @sequence.music_session = @music_session
    @sequence.playlist_source_id = 1 # à remplir avec l'api
    if @sequence.save
      @sequence.shuffle_all_tracks
      redirect_to music_session_path(@music_session)
    else
      render :new
    end
  end

  def destroy
    @sequence = Sequence.find(params[:id])
    @sequence.destroy
    redirect_to music_session_path, status: :see_other
  end

  private

  def sequence_params
    params.require(:sequence).permit(:name, :duration,
    :playlist_source_name, :transition)
  end
end
