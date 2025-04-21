FactoryBot.define do
  factory :service_category do
    name { Faker::Job.position }
  end
end
