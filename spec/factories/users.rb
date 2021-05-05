FactoryBot.define do
  FactoryBot.define do
    factory :user do
      name { 'Aaron' }
      username { 'Sumner' }
      email { 'tester@example.com' }
      password { 'dottle-nouveau-pavilion-tights-furze' }
    end
  end

  # # 投稿なしのユーザーファクトリ（投稿を持たない）
  # factory :user, aliases: [:post, :favorite] do
  #   sequence(:username) { |n| "TEST_USER_NAME#{n}" }
  #   sequence(:name) { |n| "TEST_NAME#{n}" }
  #   sequence(:email) { |n| "TEST#{n}@example.com" }
  #   sequence(:password) { |n| "testpass#{n}" }
  #   # 投稿ありのユーザーファクトリ（ユーザーのあとに投稿データを生成する）
  #   factory :user_with_posts do
  #     transient do
  #       posts_count { 5 }
  #     end
  #
  #     after(:create) do |user, evaluator|
  #       create_list(:post, evaluator.posts_count, user: user)
  #     end
  #   end
  # end
end
