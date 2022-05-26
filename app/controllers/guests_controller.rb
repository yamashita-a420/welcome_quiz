class GuestsController < ApplicationController
  before_action :set_guest, only: %i[ show edit update destroy ]

  def index
    @guests = Guest.all
  end

  def show; end

  def new
    @guest = Guest.new
  end

  def edit; end

  def create
    @guest = guest.new(guest_params)
    if @guest.save
      redirect_to guest_url(@guest), notice: "guest was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @guest.update(guest_params)
      redirect_to guest_url(@guest), notice: "guest was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @guest.destroy
    redirect_to guests_url, notice: "guest was successfully destroyed." }
  end

  private

  def set_guest
    @guest = Guest.find(params[:id])
  end

  def guest_params
    params.require(:guest).permit(:name, :message)
  end
end
