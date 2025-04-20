class Service < ApplicationRecord
  belongs_to :service_category

  validates :name, presence: true
end
