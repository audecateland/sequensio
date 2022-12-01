class CreateTracks < ActiveRecord::Migration[7.0]
  def change
    create_table :tracks do |t|
      t.string :title
      t.string :artist
      t.integer :duration_track
      t.string :track_source_id
      t.references :sequence, null: true, foreign_key: true

      t.timestamps
    end
  end
end
