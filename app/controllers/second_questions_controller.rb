class SecondQuestionsController < ApplicationController
  def show
    @second_question = Question.find(params[:format])
    @choices = @second_question.choices.order(created_at: :desc)
    @third_question = Question.find(params[:question][:third_question])
    @first_question = Question.find(params[:question][:first_question])
  end
end