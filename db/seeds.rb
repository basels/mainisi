User.create!(name:  "Foo Bar",
             email: "foobar@starwars.com",
             password:              "foobar",
             password_confirmation: "foobar")

99.times do |n|
  name  = Faker::Name.name
  email = "jedi_#{n+1}@starwars.com"
  password = "123456"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end
