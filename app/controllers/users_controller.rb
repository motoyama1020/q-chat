class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def edit
    @message = Message.new
    @user = User.find(params[:id])
  end

  def update
    if current_user.update(user_params)
      redirect_to user_path
    else
      render :edit
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:clear_time, :event_time, :name, :email, :image, :password, :password_confirmation)
  end
end
