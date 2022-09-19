class QuizTopsController < ApplicationController
  skip_before_action :require_login, only: %i[index]
  before_action :set_quiz_top, only: %i[show edit update destroy]

  def index
    @user = User.find(params[:user_id])
    @quiz_top = QuizTop.find_by(user_id: @user.id)
  end

  def new
    @quiz_top = QuizTop.new
  end

  def create
    @quiz_top = QuizTop.new(quiz_top_params)
    if @quiz_top.save
      redirect_to quiz_top_path, success: t('defaults.message.created', item: QuizTop.model_name.human)
    else
      flash.now[:danger] = t('defaults.message.not_created', item: QuizTop.model_name.human)
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @quiz_top.update(quiz_top_params)
      redirect_to quiz_top_path, success: t('defaults.message.updated', item: QuizTop.model_name.human)
    else
      flash.now[:danger] = t('defaults.message.not_updated', item: QuizTop.model_name.human)
      render :edit
    end
  end

  def destroy
    @quiz_top.destroy!
    redirect_to quiz_path, success: t('defaults.message.deleted', item: QuizTop.model_name.human)
  end

  private

  def set_quiz_top
    @quiz_top = current_user.quiz_top
  end

  def quiz_top_params
    params.require(:quiz_top).permit(:title, :explain, :photo, :photo_cache).merge(user_id: current_user.id)
  end
end
