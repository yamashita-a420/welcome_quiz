class SecondQuestionsController < ApplicationController
  skip_before_action :require_login, only: %i[show]
  layout 'layouts/quiz'

  def show
    # 表示するquestionとchoices
    @second_question = Question.find(params[:id])
    @choices = @second_question.choices.order(created_at: :desc)
    # 設定したquestionの情報
    @first_question = Question.find(params[:question][:first_question])
    @third_question = Question.find(params[:question][:third_question])
    # 回答したchoiceの情報
    @first_choice = Choice.find(params[:question][:first_choice])
  end
end
