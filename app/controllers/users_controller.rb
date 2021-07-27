class UsersController < ApplicationController
  before_action :authenticated!, except: %i[login]
  before_action :verify_admin!, only: %i[sign_up]

  def index
    render json: User.all.order(id: :asc)
  end

  def create
    new_user = User.create(user_params)
    if new_user.valid?
      render json: { token: encode({ user_id: new_user.id }) }, status: :created
    else
      render json: new_user.errors, status: :unprocessable_entity
    end
  end

  def login
    @user = User.find_by_username(params[:username])
    if @user && @user.authenticate(params[:password])
      puts encode({ user_id: @user.id })
      render json: { message: "Succesful login", token: encode({ user_id: @user.id }) }, status: :ok
    else
      render json: { error: "Invalid username or password" }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:user, :username, :password, :user_type)
  end
end
