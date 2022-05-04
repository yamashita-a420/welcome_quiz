class QuestionsController < ApplicationController
  before_action :set_question, only: %i[ show edit update destroy ]

  def index
    @questions = Question.joins(:choice).select_all.order(created_at: :desc)
  end

  def new
    @question = Question.new
  end

  def create
    @question = current_user.questions.build(question_params)
    if @question.save
      redirect_to question_url(@question), notice: "question was successfully created."
    else
      render :new
    end
  end

  def show
    @choices = @question.choice.order(created_at: :desc)
  end

  def edit; end

  def update
    if @question.update(question_params)
      redirect_to question_url(@question), notice: "Create question was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to questions_url, notice: "Create question was successfully destroyed."
  end

  private
  
  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:photo, :photo_cache, :content, :comment, :level)
  end
end
