class ThirdQuestionsController < ApplicationController
  skip_before_action :require_login, only: %i[show]
  layout 'layouts/quiz'

  def show
    # 表示するquestionとchoices
    @third_question = Question.find(params[:id])
    @choices = @third_question.choices.order(created_at: :desc)
    # 設定したquestionの情報
    @first_question = Question.find(params[:first_question])
    @second_question = Question.find(params[:second_question])
    # 回答したchoiceの情報
    @first_choice = Choice.find(params[:first_choice])
    @second_choice = Choice.find(params[:second_choice])
  end
end
