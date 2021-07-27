class ReservationMailer < ApplicationMailer
    def booking_confirmation_email(reservation)
        @reservation = reservation
        mail to: @reservation.email, subject: "#{@reservation.first_name}, your booking has been confirmed"        
    end
end
