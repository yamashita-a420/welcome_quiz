class MessagesController < ApplicationController
  def new
    @message = Message.new
    @first_question = Question.find(params[:question][:first_question])
    @second_question = Question.find(params[:question][:second_question])
    @third_question = Question.find(params[:format])
    @choices = @first_question.choices.order(created_at: :desc)
  end

  def create
    message = Message.new(message_params)
    if message.save
      redirect_to result_url, notice: "message was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:name, :body)
  end
end
