class ServiceCategory < ApplicationRecord
  has_many :services

  validates :name, presence: true
end
