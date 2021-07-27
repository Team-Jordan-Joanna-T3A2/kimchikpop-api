class ReservationMailer < ApplicationMailer
    def booking_confirmation_email(reservation)
        @reservation = reservation
        mail to: @reservation.email, subject: "Your booking has been confirmed"        
    end
end
