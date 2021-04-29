# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# 固定ユーザー作成
1.times do |n|
  hobby = Faker::Book.title
  address = Faker::Address.state
  [
    ['ふるねーむ', 'ユーザーネーム', 'test1@test.com', 'hogehoge', File.open('./app/assets/images/default-first-user-icon.png'),
      'https://www.google.com/', "ユーザーネームです！<br />好きな本は、「#{hobby}」です！！<br />よろしくお願いします😌",
      '00011112222', 0],
    ['田中太郎', 'タナカタロウ', 'test2@test.com', 'gehogeho', File.open('./app/assets/images/default-second-user-icon.png'),
      'https://www.yahoo.co.jp/', "タナカタロウです！<br />好きな本は、「#{hobby}」です！！<br />よろしくお願いします😌",
      '00033334444', 0],
    ['山田花子', 'ヤマダハナコ', 'test3@test.com', 'foobar', File.open('./app/assets/images/default-third-user-icon.png'),
      'https://www.youtube.com/', "ヤマダハナコです！<br />好きな本は、「#{hobby}」です！！<br />よろしくお願いします😌",
      '00055556666', 1]
  ].each do |name, username, email, password, profile_photo,
             website, introduction,
             phone_number, sex|
    User.create!(
      name: name,
      username: username,
      email: email,
      password: password,
      profile_photo: profile_photo,
      website: website,
      introduction: introduction,
      phone_number: phone_number,
      sex: sex
    )
    puts "[" + "\e[32m" + "\"#{username}\" のアカウントが作成されました!" + "\e[0m" + "]"
  end

  User.all.each do |user|
    user.posts.create!(
      user_id: User.find(user.id),
      caption: "キャプション",
      hashword: "#テスト",
      address: "スカイツリー"
    )
    puts "[" + "\e[32m" + "\"#{user.username}\" の投稿が作成されました!" + "\e[0m" + "]"
  end

  Post.all.each do |post|
    post.photos.create!(
      post_id: Post.find(post.id),
      image: File.open('./app/assets/images/faker-image-skytree.jpeg')
    )
    puts "[" + "\e[32m" + "投稿ID: \"#{post.id}\" の画像が設定されました!" + "\e[0m" + "]"
  end
end

# サンプルユーザー作成
50.times do |n|
  name = Faker::Name.name
  username = Faker::Creature::Animal.name
  email = Faker::Internet.unique.free_email
  password = Faker::Internet.password(min_length: 6)
  hobby = Faker::Book.title
  introduction = "#{username}です！<br />好きな本は、「#{hobby}」です！！<br />よろしくお願いします😄"

  User.create!(name: name,
               username: username,
               email: email,
               password: password,
               password_confirmation: password,
               introduction: introduction
             )
  puts "[" + "\e[32m" + "\"#{username}\" のサンプルアカウントが作成されました!" + "\e[0m" + "]"
end
