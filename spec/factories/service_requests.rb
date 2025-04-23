FactoryBot.define do
  factory :service_request do
    title { Faker::Job.title }
    description { Faker::Lorem.paragraph(sentence_count: (rand() * 5).to_i + 1) }
    status { 'open' }
    client { create(:user, role: 'client') }
    service
  end
end
