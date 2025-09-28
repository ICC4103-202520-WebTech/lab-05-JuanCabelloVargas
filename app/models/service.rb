class Service < ApplicationRecord
  has_many :service_usages

  validates :name, presence: true
end
