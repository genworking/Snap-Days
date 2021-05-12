FactoryBot.define do
  factory :user do
    name { 'Aaron' }
    username { 'Sumner' }
    email { 'tester@example.com' }
    password { 'dottle-nouveau-pavilion-tights-furze' }

    trait :name_hoge do
      name { 'hogehoge' }
    end
  end
end
