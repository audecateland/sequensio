class MusicSession < ApplicationRecord
  belongs_to :user
  has_many :sequences
  has_many :tracks, through: :sequences

  validates :name, presence: true
  validates :name, uniqueness: { scope: :user_id }
  validates :category, presence: true

  def total_tracks_duration
    tracks.sum(:duration)
  end
end
