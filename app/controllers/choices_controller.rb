class ChoicesController < ApplicationController
  before_action :set_choice, only: %i[ edit update destroy ]

  def new; end

  def create
    @choice = current_user.choices.build(choice_params)
    @choice.save
  end

  def edit; end

  def update
    if @choice.update(choice_params)
      redirect_to choice_url(@choice), notice: "Choice was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @choice.destroy
    redirect_to choices_url, notice: "Choice was successfully destroyed."
  end

  private

  def set_choice
    @comment = current_user.choices.find(params[:id])
  end

  def choice_params
    params.require(:choice).permit(:content, :correct_answer).merge(question_id: params[:question_id])
  end
end
