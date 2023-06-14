FactoryBot.define do
  factory :task do
    title { "1:Factoryで作ったデフォルトのタイトル" }
    content { "1:Factoryで作ったデフォルトのコンテント" }
    deadline { 7.days.from_now }
    status { 0 }
  end
  factory :second_task, class: Task do
    title { "2:Factoryで作ったデフォルトのタイトル" }
    content { "2:Factoryで作ったデフォルトのコンテント" }
    deadline { 2.days.from_now }
    status { 1 }
  end
  factory :third_task, class: Task do
    title { "3:Factoryで作ったデフォルトのタイトル" }
    content { "3:Factoryで作ったデフォルトのコンテント" }
    deadline { 3.days.from_now }
    status { 2 }
  end
end
