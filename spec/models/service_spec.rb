require 'rails_helper'

RSpec.describe Service, type: :model do
  describe 'creation validation' do
    it 'creates without name' do
      service = build(:service, name: nil)
      expect(service).not_to be_valid
    end

    it 'creates without service category' do
      service = build(:service, service_category: nil)
      expect(service).not_to be_valid
    end
  end
end
