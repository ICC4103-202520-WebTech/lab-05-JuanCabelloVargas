class Reservation < ApplicationRecord
  belongs_to :guest
  belongs_to :room
  has_many :service_usages
  has_one :invoice

  validates :code, presences: true, uniqueness: true
  validates :check_in, :check_out, :status, :adults, presence: true
end
