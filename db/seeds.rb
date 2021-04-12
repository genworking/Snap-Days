# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# サンプルユーザー作成
50.times do |n|
  name = Faker::Name.name
  username = Faker::Creature::Animal.name
  email = Faker::Internet.unique.free_email
  password = Faker::Internet.password(min_length: 6)
  hobby = Faker::Book.title
  introduction = "#{username}です！<br />好きな本は、「#{hobby}」です！！<br />よろしくお願いします😌"

  User.create!(name: name,
              username: username,
              email: email,
              password: password,
              password_confirmation: password,
              introduction: introduction
  )
end
