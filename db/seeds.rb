User.create!(name: "Bình ADMIN",
  email: "example@railstutorial.org",
  password: "zxcvbn",
  password_confirmation: "zxcvbn",
  admin: true)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "zxcvbn"
  User.create!(name:  name,
    email: email,
    password: password,
    password_confirmation: password)
end
