10.times do |n|
  name = Faker::Games::SuperMario.name
  email = Faker::Internet.email
  password = "password"
  User.create!(name: name, email: email, password: password, admin: false)
end

name_admin = "admin1"
email_admin = "admin1@gmail.com"
password_admin = "adminuser"
User.create!(name: name_admin, email: email_admin, password: password_admin, admin: true)

User.all.each do |user|
  title = Faker::JapaneseMedia::DragonBall.character
  content = Faker::JapaneseMedia::DragonBall.planet
  deadline = 7.days.from_now
  status = 1
  priority = 1
  user.tasks.create!(title: title, content: content, deadline: deadline, status: status, priority: priority)
end
