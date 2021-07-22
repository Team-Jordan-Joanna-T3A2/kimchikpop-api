class UsersController < ApplicationController
  before_action :set_user, only: %i[update destroy show]

  def index
    render json: User.all.order(id: :asc)
  end

  def show
    render json: @user, status: :ok
  end

  def create
    @user = User.new(user_params)
    if @user.save
      #if the user saves successfully
      render json: @user, status: :created
    else
      #if it errors out
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      render json: @user, status: :ok
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :password, :user_type)
  end
end
