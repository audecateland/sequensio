class AddSpotifyKeyToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :spotify_key, :string
  end
end
