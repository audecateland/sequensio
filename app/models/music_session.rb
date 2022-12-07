class MusicSession < ApplicationRecord
  belongs_to :user
  has_many :sequences, dependent: :destroy
  has_many :tracks, through: :sequences
  validates :name, presence: true
  validates :name, uniqueness: { scope: :user_id }
  validates :category, presence: true

  #def create_playlist
    # RSpotify::authenticate(ENV['RSPOTIFY_CLIENT_ID'], ENV['RSPOTIFY_CLIENT_SECRET'])
    # me = RSpotify::User.new(request.env['omniauth.auth'])
    #me = RSpotify::User.find(self.user.uid)
    #me.create_playlist!(self.name)
    #tracks = []
    #self.sequences.each do |sequence|
      #tracks << sequence.tracks
    #end
    #playlist.add_tracks!(tracks)

  #end

end
