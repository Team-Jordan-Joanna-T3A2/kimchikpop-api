require 'rails_helper'

RSpec.describe Reservation, type: :model do
  subject { FactoryBot.build(:reservation) }
  
  context 'validations' do
    it 'should have a valid factory' do
      expect(subject).to be_valid 
    end

    it 'is not valid without a first name' do
      subject.first_name = nil
      expect(subject).to be_invalid
    end

    it 'is not valid without a last name' do
      subject.last_name = nil
      expect(subject).to be_invalid
    end
    
    it 'is not valid without an email' do
      subject.email = nil
      expect(subject).to be_invalid
    end

    it 'is not valid without a phone number' do
      subject.phone_number = nil
      expect(subject).to be_invalid
    end

    it 'is not valid without a time' do
      subject.time = nil
      expect(subject).to be_invalid
    end

    it 'is not valid without party size of 0' do
      subject.pax = 0
      expect(subject).to be_invalid
    end

    it 'must have a unique code' do
      FactoryBot.create(:reservation, code: 'test')
      subject.code = 'test'
      expect(subject).to be_invalid
    end
  end

  context 'scope methods' do
    describe '.today' do
      it 'includes reservations from today' do
        reservation_today = FactoryBot.create(:reservation, time: Date.current)
        expect(Reservation.today).to include(reservation_today)
      end

      it 'should excludes reservations from tomorrow' do
        reservation_tomorrow = FactoryBot.create(:reservation, time: Date.current + 1.day)
        expect(Reservation.today).to_not include(reservation_tomorrow)
      end    
    end
  end
end
