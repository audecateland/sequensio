# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# EN COMMENTAIRE POUR TESTER API ??

# p 'cleaning db.....'

# Track.destroy_all
# Sequence.destroy_all
# MusicSession.destroy_all
# User.destroy_all

# #users
# users = %w[aude mat pedro nicolo]

# #music_sessions
# music_sessions_seed = [{ name: "run", category: "sport" }, { name: "yoga", category: "sport" }, { name: "pasta", category: "cuisine" }, { name: "concentration", category: "travail" }, { name: "balade", category: "promenade" }]

# # sequences
# seq_un = { name: 'un', duration: '5', playlist_source_id: 'a' }
# seq_deux = { name: 'deux', duration: '10', playlist_source_id: 'b', music_session_id: 2 }
# seq_trois = { name: 'trois', duration: '6', playlist_source_id: 'c', music_session_id: 3 }
# seq_quatre = { name: 'quatre', duration: '8', playlist_source_id: 'd', music_session_id: 4 }

# # tracks
# tracks_seed_a = [{ duration_track: 180000, title: 'sur la route', artist: 'De palmas', track_source_id: 1  }, { duration_track: 180000, title: 'je roule', artist: 'Soprano', track_source_id: 2 }, { duration_track: 180000, title: 'Les lacs du Connemara', artist: 'Sardou Michou', track_source_id: 3 }, { duration_track: 180000, title: 'My heart will go on', artist: 'Celine', track_source_id: 4 }, { duration_track: 180000, title: 'La fièvre', artist: 'NTM', track_source_id: 5 }]

# tracks_seed_b = [{ duration_track: 180000, title: 'toxic', artist: 'Britney baby', track_source_id: 6 }, { duration_track: 180000, title: 'cette année là', artist: 'Cloclo', track_source_id: 7 }, { duration_track: 180000, title:'Champs Elysee', artist: 'Joe Dassin', track_source_id: 8 }, { duration_track: 180000, title:'La boulette', artist: 'Diams', track_source_id: 9 }, { duration_track: 180000, title:'Stach Stach', artist: 'Anthologigi', track_source_id: 10 }]

# users.each do |user|
#   user = User.create!(password: 'azerty', email: "#{user}@mail.fr")
#   new_music_session = user.music_sessions.create!(music_sessions_seed.sample)
#   p "created music_session: #{new_music_session}"
#   p "generating sequences"
#   [seq_un, seq_deux].each do |attributes|
#     new_sequence = new_music_session.sequences.create!(attributes)
#     p "created sequence #{new_sequence}"
#     # new_sequence.tracks.create!(tracks_seed_a)
#     Track.create!(tracks_seed_a)
#     p "created sequence #{Track.last}"
#   end

#   [seq_trois, seq_quatre].each do |attributes|
#     new_sequence = new_music_session.sequences.create!(attributes)
#     p "created sequence #{new_sequence}"
#     # new_sequence.tracks.create!(tracks_seed_b)
#     Track.create!(tracks_seed_b)
#     p "created sequence #{Track.all}"
#   end
# end
# puts "Seed finished!"

# Track.all.each { |track| track.update(track_source_id: track.id)}
# aude = User.create!(password: 'azerty', email: 'aude@mail.fr')
# mat = User.create!(password: 'azerty', email: 'mat@mail.fr')
# pedro = User.create!(password: 'azerty', email: 'pedro@mail.fr')
# nicolo = User.create!(password: 'azerty', email: 'nicolo@mail.fr')


# Run = MusicSession.create(name: 'Run', category: 'Sport', user_id: 1)
# Yoga = MusicSession.create(name: 'Yoga', category: 'Sport', user_id: 2)
# Pasta = MusicSession.create(name: 'Pasta', category: 'Cuisine', user_id: 3)
# Travail = MusicSession.create(name: 'Travail', category: 'Travail', user_id: 4)
# Balade = MusicSession.create(name: 'Balade', category: 'Promenade', user_id: 4)

# un = Sequence.create!(name: 'un', duration: '2', playlist_source_id: 'a', music_session_id: 1)
# deux = Sequence.create!(name: 'deux', duration: '4', playlist_source_id: 'b', music_session_id: 2)
# trois = Sequence.create!(name: 'trois', duration: '6', playlist_source_id: 'c', music_session_id: 3)
# quatre = Sequence.create!(name: 'quatre', duration: '8', playlist_source_id: 'd', music_session_id: 4)

# track1 = Track.create!(title:'sur la route', artist: 'De palmas', sequence_id: 1)
# track2 = Track.create!(title:'je roule', artist: 'Soprano', sequence_id: 2)
# track4 = Track.create!(title:'Les lacs du Connemara', artist: 'Sardou Michou', sequence_id: 3)
# track5 = Track.create!(title:'My heart will go on', artist: 'Celine', sequence_id: 4)
# track6 = Track.create!(title:'La fièvre', artist: 'NTM', sequence_id: 1)
