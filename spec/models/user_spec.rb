require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'User creation validation' do
    it 'creates without name' do
      user = build(:user, name: nil)
      
      expect(user).not_to be_valid
    end
  end
end
