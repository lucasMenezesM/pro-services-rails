FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.unique.email }
    password { 'password123' }
    password_confirmation { 'password123' }
    role { 'client' }
    address { Faker::Address.street_address }
    country { Faker::Address.country }
    city { Faker::Address.city }
    state { Faker::Address.state }
  end
end
