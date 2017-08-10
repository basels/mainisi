50.times do |n|
  name  = Faker::HarryPotter.character
  email = "hp_#{n + 1}@hogwarts.edu"
  password = "123456"
  User.create!(name:                  name,
               email:                 email,
               password:              password,
               password_confirmation: password)
end

25.times do |n|
  story = Faker::HarryPotter.quote
  user = User.find(rand(1..10))
  Story.create!(content:              story,
                user:                 user)
end
