FactoryBot.define do
  factory :task do
    user
    title { "1:Factoryで作ったデフォルトのタイトル" }
    content { "1:Factoryで作ったデフォルトのコンテント" }
    deadline { 7.days.from_now }
    status { 0 }
    priority { 1 }
  end
  factory :second_task, class: Task do
    user
    title { "2:Factoryで作ったデフォルトのタイトル" }
    content { "2:Factoryで作ったデフォルトのコンテント" }
    deadline { 2.days.from_now }
    status { 1 }
    priority { 0 }
  end
  factory :third_task, class: Task do
    user
    title { "3:Factoryで作ったデフォルトのタイトル" }
    content { "3:Factoryで作ったデフォルトのコンテント" }
    deadline { 3.days.from_now }
    status { 2 }
    priority { 2 }
  end
  factory :fourth_task, class: Task do
    user
    title { "4:Factoryで作ったデフォルトのタイトル" }
    content { "4:Factoryで作ったデフォルトのコンテント" }
    deadline { 4.days.from_now }
    status { 2 }
    priority { 2 }
  end
  factory :fifth_task, class: Task do
    user
    title { "5:Factoryで作ったデフォルトのタイトル" }
    content { "5:Factoryで作ったデフォルトのコンテント" }
    deadline { 1.days.from_now }
    status { 0 }
    priority { 0 }
  end
  factory :sixth_task, class: Task do
    user
    title { "6:Factoryで作ったデフォルトのタイトル" }
    content { "6:Factoryで作ったデフォルトのコンテント" }
    deadline { 2.days.from_now }
    status { 1 }
    priority { 1 }
  end
end
