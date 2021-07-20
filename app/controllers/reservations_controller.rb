class ReservationsController < ApplicationController
    def index
        @reservations = Reservation.all
        render json: @reservations
    end

    # def create
    #     @reservation = Reservation.create(reservation_params)
    # end

    # private
    # def reservation_params
    #     params.permit()
    # end
end
