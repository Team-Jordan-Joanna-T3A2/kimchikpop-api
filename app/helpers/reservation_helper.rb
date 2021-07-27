# Module to generate access codes for bookings

module ReservationHelper
  def generate
    new_code = SecureRandomString.new(6, lowercase: :false)
    uniq = true
    Reservations.all.each { |reservation| uniq = false if reservation.code = new_code }
    if uniq 
      return new_code
    else
      self.generate
    end
  end
end
