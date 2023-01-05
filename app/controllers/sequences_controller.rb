class SequencesController < ApplicationController

  def edit
    @sequence = Sequence.find(params[:id])
    @music_session = MusicSession.find(params[:music_session_id])
  end

  def update
    @sequence = Sequence.find(params[:id])
    @sequence.update(sequence_params)
    redirect_to music_session_path(@sequence.music_session)
  end

def shuffle_one
  @sequence = Sequence.find(params[:sequence_id])
  @sequence.shuffle_a_track(params[:id])
  redirect_to music_session_path(@sequence.music_session)
end



  def shuffle
    # on retrouve la sequence concernée
    @sequence = Sequence.find(params[:format])
    @sequence.shuffle_all_tracks_for(current_user)
    redirect_to music_session_path(@sequence.music_session)
  end

  def new
    @sequence = Sequence.new
    @music_session = MusicSession.find(params[:music_session_id])
  end

  def create
    @sequence = Sequence.new(sequence_params)
    @music_session = MusicSession.find(params[:music_session_id])
    @sequence.music_session = @music_session
    @sequence.playlist_source_id = current_user.spotify_key
    if @sequence.save
      @sequence.shuffle_all_tracks_for(current_user)
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
