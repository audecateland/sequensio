class MusicSession < ApplicationRecord
  # SELECT_CATEGORY = %w[Cuisine Sport Travail Calme]
  belongs_to :user
  has_many :sequences, dependent: :destroy
  has_many :tracks, through: :sequences
  validates :name, presence: true
  validates :name, uniqueness: { scope: :user_id }
  validates :category, presence: true

  def ordered_track_ids
    self.sequences.order(:id).map{
        |sequence| [
          sequence.name,
          sequence.tracks
                  .order(:position)
                  .map(&:track_source_id)]
        }.to_h
  end

  def play
    playlist = spotify_user.create_playlist!(music_session.name)
    music_session.sequences.each do |sequence|
      playlist.add_tracks!(sequence.track.id)
    end
  end

  def total_tracks_duration
    tracks.map(&:duration_track).sum/60000
  end

end
