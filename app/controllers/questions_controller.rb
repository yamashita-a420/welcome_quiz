class QuestionsController < ApplicationController
  before_action :set_question, only: %i[ show edit update destroy ]

  def index
    @questions = current_user.questions.order(created_at: :desc).includes(:user)
  end

  def new
    @question = Question.new
    @question.choices.build
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to question_url(@question), notice: "question was successfully created."
    else
      render :new
    end
  end

  def show
    @choice = Choice.new
    @choices = @question.choices.order(created_at: :desc)
  end

  def edit; end

  def update
    @question = Question.new(question_params, question: @question)

    if @question.save
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
    @question = current_user.questions.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:photo, :photo_cache, :content, :comment, :level, choices_attributes: [:content, :correct_answer, :_destroy]).merge(user_id: current_user.id)
  end
end
