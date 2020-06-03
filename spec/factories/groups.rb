FactoryBot.define do
  factory :group do
    name { "MyString" }
    introduction { "MyText" }
    admin_user_id { 1 }
  end
end
