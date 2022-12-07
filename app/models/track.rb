class Track < ApplicationRecord
  belongs_to :sequence, optional: true

  acts_as_list scope: :sequence

  def shuffle_all_tracks

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
