class Reservation < ApplicationRecord
  validates :first_name, :last_name, :email, :phone_number, :time, :pax, :code, :confirmed, presence: true
  validates :code, uniqueness: true
  validates :pax, numericality: { greater_than: 0 }
end
