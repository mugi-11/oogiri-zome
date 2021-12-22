class User::UsersController < ApplicationController


  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if current_user.update(user_params)
      redirect_to user_path(@user)
    else
      render "edit"
    end
  end



  private
  def user_params
    params.require(:user).permit(:nickname, :email)
  end
end
