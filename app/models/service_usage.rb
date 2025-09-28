class ServiceUsage < ApplicationRecord
  belongs_to :reservation
  belongs_to :service

  validates :reservation_id, :service_id, :quantity, :used_at, presence: true
end
