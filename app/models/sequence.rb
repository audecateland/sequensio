class Sequence < ApplicationRecord
  SELECT_SEQ = %w[running tempo calme hot]
  SELECT_TRANS = %w[Ding Dong]
  belongs_to :music_session
  has_many :tracks, dependent: :destroy
  validates :name, presence: true
  validates :duration, presence: true
  validates :playlist_source_id, presence: true

  def shuffle_all_tracks

    timecount = 0
    # tant que il ne dépasse pas le temps indiqué par le user
    self.tracks.destroy_all
    while self.duration < timecount
      # ajouter une étape avec la connexion avec l'API (ORDRE DE JOJO)
      # recupérer une liste de tracks dans l'api
      # api_tracks = ApiService.new().get_tracks(playlist_source_name: self.playlist_source_name)
      ########
      ## Chercher une track au hasard dans la playlist qui diffère de celle qui ont déjà été attribuées à la séquence ##
      ########
      sequence_tracks_ids = self.tracks.map(&:track_source_id)
      track = Track.where.not(track_source_id: sequence_tracks_ids).sample
      track.sequence = self
      track.save
      timecount = self.tracks.map(&:duration_track).sum
    end
    # on va chercher une track et on initialise le timecount
    # tant qu'il est inférieur au temps indiqué par user, il va chercher d'autres tracks
    # On shuffle tous les tracks
    # on retourne une nouvelle liste de tracks
    # alors on sample track
  end
end
