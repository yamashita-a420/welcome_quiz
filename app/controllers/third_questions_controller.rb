class ThirdQuestionsController < ApplicationController
  def show
    @third_question = Question.find(params[:format])
    @choices = @third_question.choices.order(created_at: :desc)
    @first_question = Question.find(params[:question][:first_question])
    @second_question = Question.find(params[:question][:second_question])
  end
end
