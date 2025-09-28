class Room < ApplicationRecord
  has_many :reservations

  validates :number, :room_type, :status, presence: true
end
