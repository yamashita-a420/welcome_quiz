class ChoicesController < ApplicationController
  before_action :set_choice, only: %i[ edit ]

  def new; end

  def edit; end

  private

  def set_choice
    @question = Question.find(params[:id])
    @choice = @question.choices.find(params[:id])
  end
end
