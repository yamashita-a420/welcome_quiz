class QuizzesController < ApplicationController
  skip_before_action :require_login, only: %i[index]
  layout 'layouts/quiz_top'

  def index
    user = User.find(params[:user_id])
    @first_question, @second_question, @third_question = user.questions.sample(3)
  end
end
