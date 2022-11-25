class Appointment < ApplicationRecord
  belongs_to :client, dependent: :destroy
  has_many :appointment_services
  has_many :services, through: :appointment_services
  
  validates :name, :apt_date_time, presence: true, on: :create
  validates :at_home, inclusion: [true, false]
  validate :date_in_past?

  private

  def date_in_past?
    if apt_date_time < Date.today
      errors.add(:apt_date_time, "Cannot be in past")
    end
  end
end
