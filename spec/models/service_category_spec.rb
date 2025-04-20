require 'rails_helper'

RSpec.describe ServiceCategory, type: :model do
  describe 'creation validation' do
    it 'creates without name' do
      service_category = build(:service_category, name: nil)
      expect(service_category).not_to be_valid
    end
  end
end
