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

User.create!(
  name: 'lucas',
  email: 'lucas@email.com',
  password: 'password',
  address: Faker::Address.street_address,
  country: Faker::Address.country,
  state: Faker::Address.state,
  city: Faker::Address.city,
  role: 'admin',
)

roles = ['professional', 'client']

10.times do
  user = FactoryBot.create(:user, role: roles.sample)
  service_category = FactoryBot.create(:service_category)
  service = FactoryBot.create(:service, service_category: service_category)
  service_request = FactoryBot.create(:service_request, service: service, client: user)
  service_request2 = FactoryBot.create(:service_request, service: service, client: user)
end

puts "Seeds created successfully!"