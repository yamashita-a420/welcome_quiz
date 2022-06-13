class QuizzesController < ApplicationController
  skip_before_action :require_login, only: %i[index]
  layout 'layouts/quiz_top'

  def index
    @first_question, @second_question, @third_question = Question.all.sample(3)
  end
end
