class TakeQuizzesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @quiz_1, @quiz_2, @quiz_3 = @user.questions.sample(3)
    @choices_1, @choices_2, @choices_3 = [@quiz_1, @quiz_2, @quiz_3].map(&:choices).map{|x| x.pluck(:content)}
  end
end
