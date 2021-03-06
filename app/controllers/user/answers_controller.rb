class User::AnswersController < ApplicationController
  before_action :authenticate_user!, except:[:index]


  def new
    @theme = Theme.find(params[:id])
    @answer = Answer.new
  end

  def create
    @answer = Answer.new(answer_params)
    @answer.user_id = current_user.id
    @answer.theme_id = params[:theme_id]
    if @answer.save
      redirect_to user_theme_answers_path
    else
      render 'new'
    end
  end

  def show
    @answer = Answer.find(params[:id])
  end

  def edit
     @theme = Theme.find(params[:theme_id])
    @answer = Answer.find(params[:id])
  end

  def index
    @theme = Theme.find(params[:theme_id])

    @answers = @theme.answers.order("created_at DESC").page(params[:page]).per(5)
  end

  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy
    redirect_to user_path
  end

  private
  def answer_params
    params.require(:answer).permit(:answer, :user_id)
  end
end
