class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to new_user_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @user = User.new
  end

  def show
    if user_signed_in?
      @user = current_user
    else
      redirect_to new_user_session_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
