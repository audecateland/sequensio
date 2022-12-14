# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_12_08_130526) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "music_sessions", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "category"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_music_sessions_on_user_id"
  end

  create_table "sequences", force: :cascade do |t|
    t.string "name"
    t.integer "duration"
    t.string "playlist_source_id"
    t.string "playlist_source_name"
    t.string "transition"
    t.bigint "music_session_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["music_session_id"], name: "index_sequences_on_music_session_id"
  end

  create_table "tracks", force: :cascade do |t|
    t.string "title"
    t.string "artist"
    t.integer "duration_track"
    t.string "track_source_id"
    t.bigint "sequence_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "position"
    t.string "image_url"
    t.index ["sequence_id"], name: "index_tracks_on_sequence_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "spotify_key"
    t.string "provider", limit: 50, default: "", null: false
    t.string "uid", limit: 50, default: "", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "music_sessions", "users"
  add_foreign_key "sequences", "music_sessions"
  add_foreign_key "tracks", "sequences"
end
