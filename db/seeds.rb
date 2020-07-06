# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do |n|
    User.create!(
      email: "test#{n + 1}@gmail.com",
      name: "ケントマンNO.#{n + 1}",
      password: "password"
    )

    User.create!(
        email: "sample#{n + 1}@test.com",
        name: "山田太郎#{n + 1}",
        password: "password"
    )

    User.create!(
        email: "sample#{n + 1}@mail.com",
        name: "山田花子#{n + 1}",
        password: "password"
    )

    User.create!(
        email: "sample#{n + 1}@email.com",
        name: "タズキングNO.#{n + 1}",
        password: "password"
    )
  end