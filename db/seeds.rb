# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

ServiceRequest.delete_all
Service.delete_all
User.delete_all
ServiceCategory.delete_all

users = User.create!([
  {
    name: 'lucas',
    email: 'lucas@email.com',
    password: 'password',
    address: Faker::Address.street_address,
    country: Faker::Address.country,
    state: Faker::Address.state,
    city: Faker::Address.city,
    role: 'admin',
  },
  {
    name: 'Professional Test User',
    email: 'p_test@test.com',
    password: 'password',
    address: Faker::Address.street_address,
    country: Faker::Address.country,
    state: Faker::Address.state,
    city: Faker::Address.city,
    role: 'professional',
  },
  {
    name: 'Client Test User',
    email: 'c_test@test.com',
    password: 'password',
    address: Faker::Address.street_address,
    country: Faker::Address.country,
    state: Faker::Address.state,
    city: Faker::Address.city,
    role: 'client',
  }
])

users[0].avatar.attach(
  io: File.open(Rails.root.join("db/seeds/images/profile_picture_test.jpg")),
  filename: "avatar.jpg",
  content_type: "image/jpeg"
)

roles = ['professional', 'client']
requests_status = ['open', 'closed', 'in_progress', 'cancelled']

10.times do
  FactoryBot.create(:service_request, client: users[0], status: requests_status.sample)
  FactoryBot.create(:service_request, client: users[1], status: requests_status.sample)
  FactoryBot.create(:service_request, client: users[2], status: requests_status.sample)
end
  

10.times do
  user = FactoryBot.create(:user, role: roles.sample)
  service_category = FactoryBot.create(:service_category)
  service = FactoryBot.create(:service, service_category: service_category)
  service_request = FactoryBot.create(:service_request, service: service, client: user, status: requests_status.sample)
  service_request2 = FactoryBot.create(:service_request, service: service, client: user, status: requests_status.sample)
end

puts "Seeds created successfully!"