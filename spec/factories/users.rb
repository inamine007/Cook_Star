FactoryBot.define do
  factory :user do
    name { "MyString" }
    email { "MyString" }
    password_digest { "MyString" }
    introduction { "MyText" }
    image { "MyString" }
  end
end
