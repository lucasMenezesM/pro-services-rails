class User < ApplicationRecord
  has_many :service_requests, foreign_key: :client_id
  has_one_attached :avatar
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum :role, {:admin=>"admin", :client=>"client", :professional=>"professional"}
  
  validates :name, presence: true

  def professional?
    self.role == 'professional' || self.role == 'admin'
  end

  def client?
    self.role == 'client' || self.role == 'admin'
  end

  def admin?
    self.role == 'admin'
  end
end
