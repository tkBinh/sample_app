User.create!(name: "ADMIN",
  email: "admin@a.a",
  password: "zxcvbn",
  password_confirmation: "zxcvbn",
  admin: true,
  activated: true,
  activated_at: Time.zone.now)

20.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "zxcvbn"
  User.create!(name:  name,
    email: email,
    password: password,
    password_confirmation: password,
    activated: true,
    activated_at: Time.zone.now)
  end
  users = User.order(:created_at).take(10)
  50.times do
    content = Faker::Lorem.sentence(6)
    users.each { |user| user.microposts.create!(content: content) }
end
