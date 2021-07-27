class ApplicationController < ActionController::API

  # def decode()

  # end

  def encode(payload)
    JWT.encode(payload, Rails.application.credentials.jwt_secret_key, "HS512")
  end

  def authenticated!
    begin
      token = request.authorization.split(" ")[1]
      decoded = JWT.decode(token, Rails.application.credentials.jwt_secret_key, true, algorithm: "HS512")
      user_id = decoded[0]["user_id"]
      @user = User.find(user_id)
    rescue JWT::DecodeError
      render json: { message: "Unauthorized: Please log in" }
    end
  end

  protected

  def verify_admin!
    unless @user.admin?
      render json: { message: "You do not have admin privileges" } and return
    end
  end

  # def authenticated
  #    token = request.authorization().split(' ')[1]
  #    decoded = JWT.decode(token, Rails.application.credentials.jwt_secret_key, true, algorithm: 'HS512')
  #    user_id = decoded[0]['user_id']
  #    @user = User.find(user_id)
  #    render json: { message: 'Unauthorized: Please log in'} unless @user
  # end
end
