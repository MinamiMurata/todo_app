50.times do |n|
  title = Faker::JapaneseMedia::DragonBall.character
  content = Faker::JapaneseMedia::DragonBall.planet
  deadline = 7.days.from_now
  Task.create!(title: title, content: content, deadline: deadline)
end
