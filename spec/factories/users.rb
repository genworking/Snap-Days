FactoryBot.define do
  factory :user do
    sequence(:username) { |n| "TEST_USER_NAME#{n}"}
    sequence(:name) { |n| "TEST_NAME#{n}"}
    sequence(:email) { |n| "TEST#{n}@example.com"}
    sequence(:password) { |n| "testpass#{n}"}
  end
end
