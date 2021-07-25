class UsersController < ApplicationController
  def create
    user = User.new(user_params)

    if user.save
      render json: user.serialized_json
    else
      render json: { error: "An error has occured." }
    end
  end

  private

  def user_params
    params.require(:user).permit(:user, :username, :password, :user_type)
  end
end
