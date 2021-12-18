class User::LikesController < ApplicationController
  def create
    answer = Answer.find(params[:answer_id])
    like = current_user.likes.new(answer_id: answer.id)
    like.save
    redirect_to user_theme_answers_path
  end

  def destroy
    answer = Answer.find(params[:answer_id])
    like = current_user.likes.find_by(answer_id: answer.id)
    like.destroy
    redirect_to  user_theme_answers_path
  end
end
