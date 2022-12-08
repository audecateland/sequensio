class MusicSession < ApplicationRecord
  # SELECT_CATEGORY = %w[Cuisine Sport Travail Calme]
  belongs_to :user
  has_many :sequences, dependent: :destroy
  has_many :tracks, through: :sequences
  validates :name, presence: true
  validates :name, uniqueness: { scope: :user_id }
  validates :category, presence: true


  ########
  # def create_playlist
  #   RSpotify::authenticate(ENV['RSPOTIFY_CLIENT_ID'], ENV['RSPOTIFY_CLIENT_SECRET'])
  #   #me = RSpotify::User.new(request.env['omniauth.auth'])
  #   me = RSpotify::User.find(self.user.uid)
  #   # debugger
  #   me.create_playlist!("coco")
  #   tracks = []
  #   self.sequences.each do |sequence|
  #     tracks << sequence.tracks
  #   end
  #   playlist.add_tracks!(tracks)

  # end
  ########

  def play
    playlist = spotify_user.create_playlist!(music_session.name)
    music_session.sequences.each do |sequence|
      playlist.add_tracks!(sequence.track.id)
    end
  end

  def total_tracks_duration
    tracks.sum(:duration)
  end


  # def self.search
  #   tag = MusicSession.find_by(:category)
  # end

end
