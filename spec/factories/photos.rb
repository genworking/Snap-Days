FactoryBot.define do
  factory :photo do
    image { File.open("./app/assets/images/2.jpeg") }
    association :post
  end
end
