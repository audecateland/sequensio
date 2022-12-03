class MusicSession < ApplicationRecord
  belongs_to :user
  has_many :sequences, dependent: :destroy
  validates :name, presence: true
  validates :name, uniqueness: { scope: :user_id }
  validates :category, presence: true

  def chiffre
    number = 1
    number = number + 1
  end
end
