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
    self.tracks.destroy_all
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

  def shuffle_a_track(track_id)
    timecount = 0
    # tant que il ne dépasse pas le temps indiqué par le user
    # api_tracks = ApiService.new().get_tracks(playlist_source_name: self.playlist_source_name)

    sequence_tracks_ids = self.tracks.map(&:track_source_id)
    self.tracks.find_by(id: track_id).destroy
    while timecount < (self.duration * 60000) && self.tracks.count != Track.all.count
      # p self.tracks.count
      # p Track.all.count
      # ajouter une étape avec la connexion avec l'API (ORDRE DE JOJO)
      # recupérer une liste de tracks dans l'api
      ########
      ## Chercher une track au hasard dans la playlist qui diffère de celle qui ont déjà été attribuées à la séquence ##
      ########
      track = Track.where.not(track_source_id: sequence_tracks_ids).sample
      track.sequence = self
      track.save
      self.tracks << track
      # timecount += track.duration_track
      timecount = self.tracks.map(&:duration_track).sum
      p "#{timecount} : #{self.duration * 60000}"
    end
    # on va chercher une track et on initialise le timecount
    # tant qu'il est inférieur au temps indiqué par user, il va chercher d'autres tracks
    # On shuffle tous les tracks
    # on retourne une nouvelle liste de tracks
    # alors on sample track
  end


  def shuffle_all_tracks
    raise
    timecount = 0
    # tant que il ne dépasse pas le temps indiqué par le user
    # api_tracks = ApiService.new().get_tracks(playlist_source_name: self.playlist_source_name)
    self.tracks.destroy_all
    while timecount < (self.duration * 60000) && self.tracks.count != Track.all.count
      # p self.tracks.count
      # p Track.all.count
      # ajouter une étape avec la connexion avec l'API (ORDRE DE JOJO)
      # recupérer une liste de tracks dans l'api
      ########
      ## Chercher une track au hasard dans la playlist qui diffère de celle qui ont déjà été attribuées à la séquence ##
      ########
      sequence_tracks_ids = self.tracks.map(&:track_source_id)
      track = Track.where.not(track_source_id: sequence_tracks_ids).sample
      track.sequence = self
      track.save
      self.tracks << track
      # timecount += track.duration_track
      timecount = self.tracks.map(&:duration_track).sum
      p "#{timecount} : #{self.duration * 60000}"
    end
    # on va chercher une track et on initialise le timecount
    # tant qu'il est inférieur au temps indiqué par user, il va chercher d'autres tracks
    # On shuffle tous les tracks
    # on retourne une nouvelle liste de tracks
    # alors on sample track
  end
end

#hello
