class Reservation < ApplicationRecord
    validates :first_name, :last_name, :email, :phone_number, :time, :pax, :code, :confirmed, presence: true
end
