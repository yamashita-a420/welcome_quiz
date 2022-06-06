class FirstQuestionsController < QuizzesController
  def show
    @first_question = Question.find(params[:format])
    @choices = @first_question.choices.order(created_at: :desc)
    @second_question = Question.find(params[:question][:second_question])
    @third_question = Question.find(params[:question][:third_question])
  end
end
