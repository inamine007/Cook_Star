FactoryBot.define do
  factory :user do
    name { "テストユーザー" }
    email { "test@email.com" }
    password { "password" }
    introduction { "テストテキストテストテキスト" }
    image { Rack::Test::UploadedFile.new Rails.root.join('spec/files/test.png'), 'image/png' }

    after(:create) do |user|
      user.groups << create(:group)
    end
  end
end
