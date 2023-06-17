FactoryBot.define do
  factory :user do
    name { "一般ユーザーです" }
    email { "generaltest@test.com" }
    password { "123456" }
    admin { false }
  end
  factory :second_user, class: User do
    name { "管理者ユーザーです" }
    email { "admintest@test.com" }
    password { "123456" }
    admin { true }
  end
  factory :third_user, class: User do
    name { "一般ユーザー3です" }
    email { "generaltest3@test.com" }
    password { "123456" }
    admin { false }
  end
end
