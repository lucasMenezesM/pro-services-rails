FactoryBot.define do
  factory :service_request do
    title { Faker::Job.title }
    description { Faker::Lorem.paragraph(sentence_count: (rand() * 5).to_i + 1) }
    status { 'open' }
    # client { association :user, role: 'client' }
    client { create(:user, role: 'client') }
    # accepted_by { create(:user, role: 'professional') }
    service

    transient do
      professional { association :user, role: 'professional' }
    end

    accepted_by { [nil, professional].sample }
  end
end
