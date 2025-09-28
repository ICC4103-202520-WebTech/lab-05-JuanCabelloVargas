class Invoice < ApplicationRecord
  belongs_to :reservation

  validates :reservation_id, :nights_subtotal, :tax, :total, presence: true
end
