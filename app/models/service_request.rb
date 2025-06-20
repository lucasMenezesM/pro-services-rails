class ServiceRequest < ApplicationRecord
  belongs_to :client, class_name: 'User'
  belongs_to :accepted_by, class_name: 'User', optional: true
  belongs_to :service

  validates :title, presence: true
  validates :description, presence: true

  enum :status, {
    :open=>'open',
    :closed=> 'closed',
    :in_progress=> 'in_progress',
    :cancelled=>'cancelled'
  }

end
