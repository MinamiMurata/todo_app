FactoryBot.define do
  factory :task do
    title { "1:Factoryで作ったデフォルトのタイトル" }
    content { "1:Factoryで作ったデフォルトのコンテント" }
  end
  factory :second_task, class: Task do
    title { "2:Factoryで作ったデフォルトのタイトル" }
    content { "2:Factoryで作ったデフォルトのコンテント" }
  end
end
