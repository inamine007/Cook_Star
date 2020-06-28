FactoryBot.define do
  factory :group do
    name { "テストグループ" }
    introduction { "テストテキストテストテキスト" }
    password { 1111 }
    owner_id { 1 }
  end
end
