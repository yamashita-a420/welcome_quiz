class TakeQuizzesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @question_1, @question_2, @question_3 = @user.questions.sample(3)
    @choices_1, @choices_2, @choices_3 = [@question_1, @question_2, @question_3].map(&:choices).map{|x| x.pluck(:content)}
  end
end
