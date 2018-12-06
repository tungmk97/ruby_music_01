Song.delete_all
User.delete_all

Singer.create! name: "Rhymastic",
               description: Faker::Lorem.sentence(5)

Song.create! singer_id: 1,
             title: "Yeu 4",
             lyrics: Faker::Lorem.sentence(1000),
             song_url: "https://res.cloudinary.com/trunghc/video/upload/v1542677337/Yeu_4_-_Rhymastic.mp3",
             view: 2000

10.times do |n|
  name = Faker::Name.name
  description = Faker::Lorem.sentence(5)
  Singer.create! name: name,
                 description: description
end

Genre.create! title: "Pop"
Genre.create! title: "Ballad"
Genre.create! title: "Rock"
Genre.create! title: "R&B"
Genre.create! title: "New"

GenreSong.create! genre_id: 1,
                  song_id: 1

10.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create! name:name,
               email: email,
               password: password,
               password_confirmation: password
end

10.times do |n|
  name = Faker::Name.name
  description = Faker::Lorem.sentence(5)
  Playlist.create! name: name,
                   description: description
end

10.times do |n|
  singer_id = rand(1..10)
  title = Faker::Name.name
  lyrics = Faker::Lorem.sentence(5)
  song_url = "https://res.cloudinary.com/trunghc/video/upload/v1542677337/#{n+1}.mp3"
  view = rand(1..1000)
  Song.create! singer_id: singer_id,
               title: title,
               lyrics: lyrics,
               song_url: song_url,
               view: view
end

20.times do
  GenreSong.create! genre_id: rand(1..5),
                    song_id: rand(2..11)
end

User.create! name: "Trung",
             password: "123456",
             email: "huynhchitrung97@gmail.com",
             role: 1

10.times do |n|
  name = Faker::Name.name
  password = "123456"
  email = "user#{n+1}@gmail.com"
  User.create! name: name,
               password: password,
               email: email
end

users = User.order(:created_at).take(11)
50.times do
  content = Faker::Lorem.sentence(5)
  users.each do |user|
    user.comments.create! content: content,
                          song_id: rand(1..10)
  end
end
