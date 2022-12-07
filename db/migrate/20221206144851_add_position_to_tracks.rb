class AddPositionToTracks < ActiveRecord::Migration[7.0]
  def change
    add_column :tracks, :position, :integer
  end
end
