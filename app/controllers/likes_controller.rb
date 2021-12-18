class LikesController < ApplicationController
  def create
    binding.pry
    answer = Answer.find(params[:answer_id])
    like = current_user.likes.new(answer_id: answer.id)
    like.save
    redirect_to user_theme_answers_path(answer)
  end

  def destroy
    answer = Answer.find(params[:answer_id])
    like = current_user.likes.find_by(answer_id: answer.id)
    like.destroy
    redirect_to  user_theme_answers_path(answer)
  end
end
