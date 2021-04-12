# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# サンプルユーザー作成
1.upto(49) do |n|
  name = Faker::Name.name
  username = Faker::Name.username
  email = "sample-#{n+1}@example.com"
  password = Faker::Internet.password(min_length: 6)
  introduction = "#{name}です！よろしくお願いします！！"

  User.create(name: name,
              useername: username,
              email: email,
              password: password,
              password_confirmation: password,
              introduction: introduction
end
