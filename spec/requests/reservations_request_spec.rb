require 'rails_helper'

RSpec.describe 'Reservations', type: :request do
  describe 'POST reservations#create' do
    context 'when the request is valid' do      
      before(:example) do
        @reservation_params = FactoryBot.attributes_for(:reservation)
        post reservations_path, params: {reservation: @reservation_params}        
      end

      it 'returns status success' do
        expect(response).to have_http_status :created
      end

      it 'saves the reservation to the database' do
        expect(Reservation.last.email).to eq(@reservation_params[:email])
      end
    end

    context 'when the request is invalid' do      
      before(:example) do
        @reservation_params = FactoryBot.attributes_for(:reservation, email: nil)
        post reservations_path, params: {reservation: @reservation_params}
        @parsed_response = JSON.parse(response.body, symbolize_names: true)
      end

      it 'returns status unprocessable entity' do
        expect(response).to have_http_status :unprocessable_entity
      end

      it 'returns an error message' do
        expect(@parsed_response[:email]).to eq(["can't be blank"])
      end
    end

    context 'email notifications' do
      it 'emails the user from the reservation if reservation is valid' do
        expect(ReservationMailer).to receive_message_chain(:booking_confirmation_email, :deliver_now) 
        post reservations_path, params: {reservation: FactoryBot.attributes_for(:reservation)} 
      end

      it 'does not email the user if the reservation is invalid' do
        expect(ReservationMailer).to_not receive(:booking_confirmation_email)
        post reservations_path, params: {reservation: FactoryBot.attributes_for(:reservation, email: nil)} 
      end      
    end
  end
end

