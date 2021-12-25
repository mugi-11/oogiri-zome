class User::UsersController < ApplicationController
  before_action :authenticate_user!


  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def index
    @all_ranks = Answer.find(Like.group(:answer_id).order('count(answer_id) desc').pluck(:answer_id))
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
