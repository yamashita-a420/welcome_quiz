class ChallengersController < ApplicationController
  before_action :set_challenger, only: %i[ show edit update destroy ]

  def index
    @challengers = Challenger.all
  end

  def show; end

  def new
    @challenger = Challenger.new
  end

  def edit; end

  def create
    @challenger = Challenger.new(challenger_params)
    if @challenger.save
      redirect_to challenger_url(@challenger), notice: "Challenger was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @challenger.update(challenger_params)
      redirect_to challenger_url(@challenger), notice: "Challenger was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @challenger.destroy
    redirect_to challengers_url, notice: "Challenger was successfully destroyed." }
  end

  private

  def set_challenger
    @challenger = Challenger.find(params[:id])
  end

  def challenger_params
    params.require(:challenger).permit(:name, :message)
  end
end
