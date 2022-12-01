class Sequence < ApplicationRecord
  belongs_to :music_session
  has_many :tracks, dependent: :destroy
  validates :name, presence: true
  validates :duration, presence: true
  validates :playlist_source_id, presence: true
end
