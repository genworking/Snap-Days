FactoryBot.define do
  factory :post do
    caption { "It's sunny today" }
    hashword { "" }
    address { "" }
    association :user
  end

  trait :with_hashtag do
    hashword { "hashtag_test" }
  end

  trait :with_address do
    address { "address_test" }
  end

  trait :post_sample1 do
    hashword { "hashword_sample1" }
    address { "address_sample1" }
  end
end
