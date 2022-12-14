class Sequence < ApplicationRecord
  SELECT_TRANS = %w[Ding Dong]
  belongs_to :music_session
  has_many :tracks, dependent: :destroy
  validates :name, presence: true
  validates :duration, presence: true
  validates :playlist_source_id, presence: true

  def spotify_playlist
    playlist = RSpotify::Playlist.find(self.music_session.user.uid, playlist_source_name)
  end

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
        image_url: track.album.images.dig(0, "url"),
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

    tr_id = (self.transition == "Ding" ? "17KPaV7VT9m8cV62VhKTmh" : "3OmstcG0k4HR1bDXqGPyrq")

    track = RSpotify::Track.find(tr_id)
    transition = Track.create(
      title: track.name,
      artist: track.artists.first.name,
      duration_track: track.duration_ms,
      track_source_id: track.id,
      image_url: track.album.images.dig(0, "url"),
      sequence: self
    )
  end

  def shuffle_a_track(track_id)
    # timecount = 0
    # tant que il ne dépasse pas le temps indiqué par le user
    # api_tracks = ApiService.new().get_tracks(playlist_source_name: self.playlist_source_name)

    # sequence_tracks_ids = self.tracks.map(&:track_source_id)
    track_to_shuffle = self.tracks.find_by(id: track_id.to_i)
    track_position = track_to_shuffle.position
    deleted_track_duration = track_to_shuffle.duration_track
    track_to_shuffle.destroy
    playlist = RSpotify::Playlist.find(self.playlist_source_id, self.playlist_source_name)

    spotify_tracks = playlist.tracks.map do |track|
      Track.new(
        title: track.name,
        artist: track.artists.first.name,
        duration_track: track.duration_ms,
        track_source_id: track.id,
        image_url: track.album.images.dig(0, "url"),
        sequence: self,
        position: track_position
      )
    end
    sequence_tracks_ids = self.tracks.map{ |track| track.track_source_id }
    track = spotify_tracks.reject { |track| sequence_tracks_ids.include?(track.track_source_id) || track.duration_track < 0.9 * deleted_track_duration || track.duration_track > 1.1 * deleted_track_duration }.sample
    track.save
    # while timecount < (self.duration * 60000) && self.tracks.count != Track.all.count
    #   # p self.tracks.count
    #   # p Track.all.count
    #   # ajouter une étape avec la connexion avec l'API (ORDRE DE JOJO)
    #   # recupérer une liste de tracks dans l'api
    #   ########
    #   ## Chercher une track au hasard dans la playlist qui diffère de celle qui ont déjà été attribuées à la séquence ##
    #   ########
    #   track = Track.where.not(track_source_id: sequence_tracks_ids).sample
    #   track.sequence = self
    #   track.save
    #   self.tracks << track
    #   # timecount += track.duration_track
    #   timecount = self.tracks.map(&:duration_track).sum
    #   p "#{timecount} : #{self.duration * 60000}"
    # end
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
