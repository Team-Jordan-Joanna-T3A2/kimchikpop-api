class ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[update destroy show]
  before_action :authenticated, only: %i[index update destroy]

  def index
    render json: Reservation.all.order(id: :asc)
  end

  def show
    render json: @reservation, status: :ok
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      #if the reservation saves successfully
      render json: @reservation, status: :created, code: ReservationHelper.generate
    else
      #if it errors out
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  def update
    @reservation = Reservation.find(params[:id])
    if @reservation.update(reservation_params)
      render json: @reservation, status: :ok
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @reservation.destroy
  end

  private

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  def reservation_params
    params.require(:reservation).permit(:first_name, :last_name, :email, :phone_number, :time, :pax, :code, :confirmed)
  end
end
