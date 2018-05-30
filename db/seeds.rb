User.create!(name: "Thanh Bình",
  email: "example@railstutorial.org",
  password: "zxcvbn",
  password_confirmation: "zxcvbn",
  admin: true,
  activated: true,
  activated_at: Time.zone.now)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
    email: email,
    password: password,
    password_confirmation: password,
    activated: false,
    activated_at: Time.zone.now)
end
