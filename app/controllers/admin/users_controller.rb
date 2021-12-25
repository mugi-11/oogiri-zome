class Admin::UsersController < ApplicationController

  before_action :authenticate_admin!

  def index
    @users = User.page(params[:page]).per(3)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_user_path
    else
      redirect_to edit_admin_user_path(@user)
    end
  end

  def show
    @user = User.find(params[:id])
    @answer = Answer.all
  end

  private
  def user_params
    params.require(:user).permit(:nickname, :email)
  end

end
