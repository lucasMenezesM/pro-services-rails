FactoryBot.define do
  factory :service_request do
    title { Faker::Job.title }
    description { Faker::Job.position }
    status { 'open' }
    client { create(:user, role: 'client') }
    service
  end
end
