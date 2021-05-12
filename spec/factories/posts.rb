FactoryBot.define do
  factory :post do
    caption { "It's sunny today" }
    hashword { "" }
    address { "" }
    association :user
  end

  trait :post_hashtag do
    hashword { "hashtag_test" }
  end

  trait :post_address do
    address { "address_test" }
  end
end
