# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# サンプルユーザー作成
5.times do |n|
  name = Faker::Sports::Football.name
  username = Faker::Movies::StarWars.character
  email = "sample-#{n+1}@example.com"
  password = Faker::Internet.password(min_length: 6)
  movie = Faker::Movie.title
  introduction = "#{name}です！<br />好きな映画は#{movie}です！！<br />よろしくお願いします😌"

  User.create(name: name,
              username: username,
              email: email,
              password: password,
              password_confirmation: password,
              introduction: introduction
  )
end
