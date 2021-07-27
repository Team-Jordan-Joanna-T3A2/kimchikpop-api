class Reservation < ApplicationRecord
  validates :first_name, :last_name, :email, :phone_number, :time, :pax, :code, presence: true
  validates :code, uniqueness: true
  validates :pax, numericality: { greater_than: 0 }
  scope :today, -> { where(time: Date.current.beginning_of_day..Date.current.end_of_day) }
end
