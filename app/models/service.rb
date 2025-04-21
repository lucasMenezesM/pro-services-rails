class Service < ApplicationRecord
  belongs_to :service_category
  has_many :service_requests

  validates :name, presence: true
end
