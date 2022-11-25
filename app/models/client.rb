class Client < ApplicationRecord
  has_many :appointments
  
  validates :name, presence: true
  validates :at_home, inclusion: [true, false]
end
