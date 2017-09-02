User.create!(name:                  "Admin Wildling",
             email:                 "admin@got.org",
             password:              ENV['SEED_PASSWORD'],
             password_confirmation: ENV['SEED_PASSWORD'],
             admin:                 true,
             activated:             true,
             activated_at:          Time.zone.now)

24.times do |n|
  name  = Faker::GameOfThrones.character
  email = "got_#{n + 2}@got.org"
  profile_pic = User.find_google_images(name)
  User.create!(name:                  name,
               email:                 email,
               password:              ENV['SEED_PASSWORD'],
               password_confirmation: ENV['SEED_PASSWORD'],
               profile_pic_path:      profile_pic,
               activated:             true,
               activated_at:          Time.zone.now)
end

10.times do |n|
  story = Faker::GameOfThrones.quote
  user = User.find(rand(2..10))
  Story.create!(content:              story,
                user:                 user)
end
