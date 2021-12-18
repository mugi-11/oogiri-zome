class User::AnswersController < ApplicationController

  def new
    @theme = Theme.find(params[:id])
    @answer = Answer.new
  end

  def create
    @answer = Answer.new(answer_params)
    @answer.user_id = current_user.id
    @answer.theme_id = params[:theme_id]
    if @answer.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def index
    @theme = Theme.find(params[:theme_id])
    @answers = Answer.all
    
  end

  private
  def answer_params
    params.require(:answer).permit(:answer, :user_id)
  end
end
