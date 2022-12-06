class Track < ApplicationRecord
  belongs_to :sequence, optional: true
  acts_as_list scope: :sequence

end
