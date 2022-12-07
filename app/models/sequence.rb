require "debug"

class Sequence < ApplicationRecord
  SELECT_TRANS = %w[Ding Dong]
  belongs_to :music_session
  has_many :tracks, dependent: :destroy
  validates :name, presence: true
  validates :duration, presence: true
  validates :playlist_source_id, presence: true

  def shuffle_all_tracks_for(user)
    timecount = 0

    playlist = RSpotify::Playlist.find(self.playlist_source_id, self.playlist_source_name)
    spotify_tracks = playlist.tracks.map do |track|
      Track.new(
        title: track.name,
        artist: track.artists.first.name,
        duration_track: track.duration_ms,
        track_source_id: track.id,
        sequence: self
      )
    end

    while timecount < (self.duration * 60000) && self.tracks.count != spotify_tracks.count
      sequence_tracks_ids = self.tracks.map{ |track| track.track_source_id }
      track = spotify_tracks.reject{ |track| sequence_tracks_ids.include?(track.track_source_id)}.sample
      track.save
      self.tracks << track
      timecount = self.tracks.map(&:duration_track).sum
    end
  end
end
