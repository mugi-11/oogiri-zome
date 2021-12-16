class User::AnswersController < ApplicationController

  def new
    @theme = Theme.find(params[:id])
    @answer = Answer.new
  end

  def create
    @answer = Answer.new(answer_params)
    @answer.user_id = current_user.id
    theme_id = params[:answer][:theme_id]
    if @answer.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private
  def answer_params
    params.require(:answer).permit(:answer, :user_id, :theme_id)
  end
end
