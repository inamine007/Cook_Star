FactoryBot.define do
  factory :recipe do
    name { "テストレシピ" }
    introduction { "テストテキストテストテキスト" }
    image { Rack::Test::UploadedFile.new Rails.root.join('spec/files/test.png'), 'image/png' }
    user
    group
  end
end
