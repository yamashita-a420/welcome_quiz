class QuizzesController < ApplicationController
  skip_before_action :require_login, only: %i[index]
  before_action :set_quiz, only: %i[show edit update destroy]

  def index
    @user = User.find(params[:user_id])
    @quiz_top = Quiz.find_by(user_id: @user.id)
  end

  def new
    @quiz = Quiz.new
    @quiz.quiz_tops.build
  end

  def create
    @quiz = Quiz.new(quiz_params)
    if @quiz.save
      redirect_to quiz_path, success: t('defaults.message.created', item: Quiz.model_name.human)
    else
      flash.now[:danger] = t('defaults.message.not_created', item: Quiz.model_name.human)
      render :new
    end
  end

  def show
    @quiz_top = QuizTop.new
    @quiz_tops = @quiz.quiz_tops.order(created_at: :desc)
  end

  def edit; end

  def update
    if @quiz.update(update_quiz_params)
      redirect_to quiz_path, success: t('defaults.message.updated', item: Quiz.model_name.human)
    else
      flash.now[:danger] = t('defaults.message.not_updated', item: Quiz.model_name.human)
      render :edit
    end
  end

  def destroy
    @quiz.destroy!
    redirect_to quiz_path, success: t('defaults.message.deleted', item: Quiz.model_name.human)
  end

  private

  def set_quiz
    @quiz = current_user.quiz
  end

  def quiz_params
    params.require(:quiz).permit(:title, :explain, quiz_tops_attributes: [:photo, :photo_cache]).merge(user_id: current_user.id)
  end

  def update_quiz_params
    params.require(:quiz).permit(:title, :explain, quiz_tops_attributes: [:photo, :photo_cache, :_destroy, :id]).merge(user_id: current_user.id)
  end
end
