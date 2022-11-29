class Sequence < ApplicationRecord
  belongs_to :session
  has_many :tracks
  validates :name, presence: true
  validates :duration, presence: true
  validates :playlist_source_id, presence: true
end
