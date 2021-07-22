# Module to generate access codes for bookings

module CodeGenerator
  def generate
    return SecureRandomString.new(6, lowercase: :false)
  end
end
