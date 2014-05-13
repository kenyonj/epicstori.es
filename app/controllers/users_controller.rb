class UsersController < ApplicationController
  def create
    @user = sign_up(user_params)

    if @user.valid?
      sign_in(@user)
      redirect_to @user
    else
      render 'homes/show'
    end
  end

  def show
    @username = current_user.username
  end

  private

  def user_params
    params.require(:user).
      permit(
        :username,
        :password,
        :email,
        :first_name,
        :last_name
      )
  end
end
