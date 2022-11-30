class CreateSequences < ActiveRecord::Migration[7.0]
  def change
    create_table :sequences do |t|
      t.string :name
      t.time :duration
      t.string :playlist_source_id
      t.string :playlist_source_name
      t.string :transition
      t.references :music_session, null: false, foreign_key: true

      t.timestamps
    end
  end
end
