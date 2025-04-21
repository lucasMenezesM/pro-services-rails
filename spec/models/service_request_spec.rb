require 'rails_helper'

RSpec.describe ServiceRequest, type: :model do
  describe 'Creation Validation' do
    it 'creates without a title' do
      service_request = build(:service_request, title: nil)
      expect(service_request).not_to be_valid
    end

    it 'creates without description' do
      service_request = build(:service_request, description: nil)
      expect(service_request).not_to be_valid
    end
  end
end
