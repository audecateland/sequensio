# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# users = ['aude', 'mat', 'pedro', 'nicolo']

# users.each do |user|
#   user = User.create!(password: 'azerty', email: "#{user}@mail.fr")
# end

aude = User.create!(password: 'azerty', email: 'aude@mail.fr')
mat = User.create!(password: 'azerty', email: 'mat@mail.fr')
pedro = User.create!(password: 'azerty', email: 'pedro@mail.fr')
nicolo = User.create!(password: 'azerty', email: 'nicolo@mail.fr')

Run = Session.create(name: 'Run', category: 'Sport', user_id: 1)
Yoga = Session.create(name: 'Yoga', category: 'Sport', user_id: 2)
Pasta = Session.create(name: 'Pasta', category: 'Cuisine', user_id: 3)
Travail = Session.create(name: 'Travail', category: 'Travail', user_id: 4)
Balade = Session.create(name: 'Balade', category: 'Promenade', user_id: 4)

un = Sequence.create!(name: 'un', duration: '2', playlist_source_id: 'a', session_id: 1)
deux = Sequence.create!(name: 'deux', duration: '4', playlist_source_id: 'b', session_id: 2)
trois = Sequence.create!(name: 'trois', duration: '6', playlist_source_id: 'c', session_id: 3)
quatre = Sequence.create!(name: 'quatre', duration: '8', playlist_source_id: 'd', session_id: 4)

track1 = Track.create!(title:'sur la route', artist: 'De palmas', sequence_id: 1)
track2 = Track.create!(title:'je roule', artist: 'Soprano', sequence_id: 2)
track4 = Track.create!(title:'Les lacs du Connemara', artist: 'Sardou Michou', sequence_id: 3)
track5 = Track.create!(title:'My heart will go on', artist: 'Celine', sequence_id: 4)
track6 = Track.create!(title:'La fièvre', artist: 'NTM', sequence_id: 1)
