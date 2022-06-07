class MessagesController < ApplicationController
  skip_before_action :require_login, only: %i[new create]

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
    #thirdがsecondと同じになってる？
    @third_choice = Choice.find(params[:question][:third_choice])
    #answer = [@first_choice, @second_choice, @third_choice]
    # 正解数
    #@score = scoring([ @first_choice, @second_choice, @third_choice ])
    #@score = Choice.scoring(answer)
    #@score = @first_choice.scoring + @second_choice.scoring + @third_choice.scoring
    binding.pry
    score = @first_choice.scoring(@first_choice)
    binding.pry
    @score = @first_choice.scoring(@first_choice) + @second_choice.scoring(@second_choice) + @third_choice.scoring(@third_choice)
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
