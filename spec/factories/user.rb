FactoryBot.define do
  factory :user do
    email { FFaker::Internet.email}
    password {"password"}
    password_confirmation {'password'}
    name { FFaker::Lorem.sentence}
  end
end