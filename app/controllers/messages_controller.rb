class MessagesController < ApplicationController
  skip_before_action :require_login, only: %i[new create show]

  def index
    @messages = current_user.messages.order(created_at: :desc)
  end

  def new
    @message = Message.new
    # 表示するquestion
    @first_question = Question.find(params[:question][:first_question])
    @second_question = Question.find(params[:question][:second_question])
    @third_question = Question.find(params[:format])
    # 回答したchoiceの情報
    @first_choice = Choice.find(params[:question][:first_choice])
    @second_choice = Choice.find(params[:question][:second_choice])
    # !!! thirdがsecondと同じになってないか？
    @third_choice = Choice.find(params[:question][:third_choice])
    # 正解数
    @score = @first_choice.scoring(@first_choice).to_i + @second_choice.scoring(@second_choice).to_i + @third_choice.scoring(@third_choice).to_i
  end

  def create
    message = Message.new(message_params)
    if message.save
      redirect_to result_url, notice: "message was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    # 表示するquestion
    @first_question = Question.find(params[:question][:first_question])
    @second_question = Question.find(params[:question][:second_question])
    @third_question = Question.find(params[:format])
    # 回答したchoiceの情報
    @first_choice = Choice.find(params[:question][:first_choice])
    @second_choice = Choice.find(params[:question][:second_choice])
    # !!! thirdがsecondと同じになってないか？
    @third_choice = Choice.find(params[:question][:third_choice])
    # 正解数
    @score = @first_choice.scoring(@first_choice).to_i + @second_choice.scoring(@second_choice).to_i + @third_choice.scoring(@third_choice).to_i
  end

  private

  def message_params
    params.require(:message).permit(:name, :body)
  end
end
