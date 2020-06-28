FactoryBot.define do
  factory :comment do
    content { "テストコメント" }
    user
    recipe
  end
end
