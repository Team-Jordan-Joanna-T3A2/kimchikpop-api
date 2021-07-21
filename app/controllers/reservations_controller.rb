class ReservationsController < ApplicationController
    def index
        render json: Reservation.all
    end

    def create
        @reservation = Reservation.new(reservation_params)
        if @reservation.save
            #if the reservation saves successfully
            render json: @reservation, status: :created
        else
            #if it errors out
            render json: @reservation.errors, status: :unprocessable_entity    
        end
    end

    private

    def reservation_params
        params.require(:reservation).permit(:first_name, :last_name, :email, :phone_number, :time, :pax, :code, :confirmed)
    end
end
