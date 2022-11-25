class Service < ApplicationRecord
  has_many :appointment_services

  validates :name, :price, presence: true
end
