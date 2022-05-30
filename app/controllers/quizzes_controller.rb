class QuizzesController < ApplicationController
  def index; end

  def show
    @questions = Question.all.sample(3)
    loop do
      break if @questions.empty?
      @question = @questions.pop
      @choices = @question.choices.order(created_at: :desc)
    end
  end
end
