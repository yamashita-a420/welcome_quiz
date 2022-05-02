class QuestionsController < ApplicationController
  before_action :set_question, only: %i[ show edit update destroy ]

  def index
    @questions = Question.all
  end

  def show; end

  def new
    @question = Question.new
  end

  def edit; end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to question_url(@question), notice: "question was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @question.update(question_params)
      redirect_to question_url(@question), notice: "Create question was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @question.destroy
    redirect_to create_questions_url, notice: "Create question was successfully destroyed."
  end

  private
  
  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:photo, :content, :comment, :leve)
  end
end
