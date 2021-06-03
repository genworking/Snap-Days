FactoryBot.define do
  factory :user do
    name { 'Aaron' }
    username { 'Sumner' }
    email { 'tester@example.com' }
    password { 'dottle-nouveau-pavilion-tights-furze' }
  end

  trait :user2 do
    name { 'Aaron2' }
    username { 'Sumner2' }
    email { 'tester2@example.com' }
  end

  trait :user3 do
    name { 'Aaron3' }
    username { 'Sumner3' }
    email { 'tester3@example.com' }
  end
end
