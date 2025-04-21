FactoryBot.define do
  factory :service do
    name { Faker::Job.field }
    service_category
  end
end
