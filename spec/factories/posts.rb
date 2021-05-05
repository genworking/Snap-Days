FactoryBot.define do
  factory :post do
    caption { "It's sunny today" }
    association :user
  end
end
