class QuizzesController < ApplicationController
  before_action :set_questions, only: %i[index show]

  def index; end

  def show
    loop do
      break if questions.empty?
      @question = questions.pop
      @choices = @question.choices.order(created_at: :desc)
    end
  end

  private

  def set_questions
    questions = Question.all.sample(3)
    @question = questions.pop
  end
end
