FactoryBot.define do
  factory :user do
    name { 'Aaron' }
    username { 'Sumner' }
    email { 'tester@example.com' }
    password { 'dottle-nouveau-pavilion-tights-furze' }
  end

  trait :testuser1 do
    name { 'testuser1' }
    username { 'testusername1' }
    email { 'testuser1@example.com' }
    post 
  end

  trait :testuser2 do
    name { 'testuser2' }
    username { 'testusername2' }
    email { 'testuser2@example.com' }
  end

  trait :name_hoge do
    name { 'hogehoge' }
  end
end
