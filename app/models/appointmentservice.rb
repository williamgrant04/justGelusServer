class Appointmentservice < ApplicationRecord
  belongs_to :appointment
  belongs_to :service
end
