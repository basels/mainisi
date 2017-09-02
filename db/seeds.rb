User.create!(name:                  "Admin Stupefy",
             email:                 "admin@hogwarts.edu",
             password:              ENV['SEED_PASSWORD'],
             password_confirmation: ENV['SEED_PASSWORD'],
             admin:                 true,
             activated:             true,
             activated_at:          Time.zone.now)

49.times do |n|
  name  = Faker::HarryPotter.character
  email = "hp_#{n + 2}@hogwarts.edu"
  User.create!(name:                  name,
               email:                 email,
               password:              ENV['SEED_PASSWORD'],
               password_confirmation: ENV['SEED_PASSWORD'],
               activated:             true,
               activated_at:          Time.zone.now)
end

25.times do |n|
  story = Faker::HarryPotter.quote
  user = User.find(rand(2..10))
  Story.create!(content:              story,
                user:                 user)
end
