class Track < ApplicationRecord
  belongs_to :sequence, optional: true
end
