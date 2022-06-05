class QuizzesController < ApplicationController

  def index
    @first_question, @second_question, @third_question = Question.all.sample(3)
  end
end
