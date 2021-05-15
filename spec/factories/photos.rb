FactoryBot.define do
  factory :photo do
    image { File.new("#{Rails.root}/public/2.jpeg") }
    association :post
  end
end
