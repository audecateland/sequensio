class MusicSessionsController < ApplicationController
  def index
    @music_sessions = MusicSession.where(user: current_user)
  end

  def show
    @music_session = MusicSession.find(params[:id])
  end

  def new
    @music_session = MusicSession.new
  end

  def create
    @music_session = MusicSession.new(music_session_params)
    @music_session.user = current_user
    if @music_session.save
      redirect_to music_session_path(@music_session)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @music_session = MusicSession.find(params[:id])
    # @new_music_session = MusicSession.copy(music_session_params)
  end

  def update
    @music_session = MusicSession.find(params[:id])
    @music_session.update(music_session_params)
    redirect_to music_session_path(@music_session)
  end

  def destroy
    @music_session = MusicSession.find(params[:id])
    @music_session.destroy
    redirect_to music_sessions_path, status: :see_other
  end

  def duplicate
    @old_music_session = MusicSession.find(params[:id])
    @new_music_session = @old_music_session.dup
    @new_music_session.name = "#{@old_music_session.name} - duplicate"
    @old_music_session.sequences.each do |sequence|
      s = sequence.dup
      s.update(music_session: @new_music_session)
    end
    @new_music_session.save
    redirect_to edit_music_session_path(@new_music_session)
  end

  def search
    @music_sessions = MusicSession.find(params[category: 'cuisine'])

  end



  private

  def music_session_params
    params.require(:music_session).permit(:name, :category, :description)
  end
end
