FactoryBot.define do
  factory :post do
    association :user

    title { FFaker::Lorem.sentence }
    body { FFaker::Lorem.sentence }
    
  end
end