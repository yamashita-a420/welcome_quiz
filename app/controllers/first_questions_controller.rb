class FirstQuestionsController < QuizzesController
  skip_before_action :require_login, only: %i[show]
  layout 'layouts/quiz'

  def show
    # 表示するquestionとchoices
    @first_question = Question.find(params[:id])
    @choices = @first_question.choices.order(created_at: :desc)
    # 設定したquestionの情報
    @second_question = Question.find(params[:second_question])
    @third_question = Question.find(params[:third_question])
  end
end
