class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:spotify]
  has_many :music_sessions

  def spotify_playlists
    me = RSpotify::User.find(self.spotify_key)
    me.playlists
  end

  def self.create_from_provider_data(provider_data)
    where(provider: provider_data.provider, uid: provider_data.uid).first_or_create  do |user|
    user.email = provider_data.info.email
    user.password = Devise.friendly_token[0, 20]
    end
  end
end
