class Sequence < ApplicationRecord
  SELECT_SEQ = %w[running tempo calme hot]
  SELECT_TRANS = %w[Ding Dong]
  belongs_to :music_session
  has_many :tracks, dependent: :destroy
  validates :name, presence: true
  validates :duration, presence: true
  validates :playlist_source_id, presence: true
end
