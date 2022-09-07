class MessagesController < ApplicationController
  skip_before_action :require_login, only: %i[new create show]

  def index
    @messages = current_user.messages.order(created_at: :desc)
  end

  def new
    @message = Message.new
    @user = User.find(params[:user_id])
    # 表示するquestion
    @first_question = Question.find(params[:first_question])
    @second_question = Question.find(params[:second_question])
    @third_question = Question.find(params[:third_question])
    # 回答したchoiceの情報
    @first_choice = Choice.find(params[:first_choice])
    @second_choice = Choice.find(params[:second_choice])
    @third_choice = Choice.find(params[:third_choice])
    # 正解数
    @score = @first_choice.scoring(@first_choice).to_i + @second_choice.scoring(@second_choice).to_i + @third_choice.scoring(@third_choice).to_i
  end

  def create
    @message = Message.new(message_params)
    @user = User.find(params[:user_id])
    if @message.save
      redirect_to user_result_message_sent_path(message: message_quiz_params)
    else
      redirect_to user_result_message_sent_path(message: quiz_params)
    end
    # 表示するquestion
    @first_question = Question.find(params[:message][:first_question])
    @second_question = Question.find(params[:message][:second_question])
    @third_question = Question.find(params[:message][:third_question])
    # 回答したchoiceの情報
    @first_choice = Choice.find(params[:message][:first_choice])
    @second_choice = Choice.find(params[:message][:second_choice])
    @third_choice = Choice.find(params[:message][:third_choice])
    # 正解数
    @score = @first_choice.scoring(@first_choice).to_i + @second_choice.scoring(@second_choice).to_i + @third_choice.scoring(@third_choice).to_i
  end

  def show
    @message = Message.find_by(message_params)
    @new_message = Message.new(message_params)
    # 表示するquestion
    @first_question = Question.find(params[:message][:first_question])
    @second_question = Question.find(params[:message][:second_question])
    @third_question = Question.find(params[:message][:third_question])
    # 回答したchoiceの情報
    @first_choice = Choice.find(params[:message][:first_choice])
    @second_choice = Choice.find(params[:message][:second_choice])
    @third_choice = Choice.find(params[:message][:third_choice])
    # 正解数
    @score = @first_choice.scoring(@first_choice).to_i + @second_choice.scoring(@second_choice).to_i + @third_choice.scoring(@third_choice).to_i
  end

  def destroy
    @message = current_user.messages.find(params[:format])
    @message.destroy
    redirect_to messages_url, notice: "Create question was successfully destroyed."
  end

  private

  def message_params
    params.require(:message).permit(:name, :body).merge(user_id: params[:user_id])
  end

  def quiz_params
    params.require(:message).permit(:first_question, :second_question, :third_question, :first_choice, :second_choice, :third_choice)
    # "message"=>{"name"=>"aya", "body"=>"クイズ楽しかったよ！", "first_question"=>"7",
    # "second_question"=>"9", "third_question"=>"11", "first_choice"=>"7", "second_choice"=>"11",
    # "third_choice"=>"13"}
  end

  def message_quiz_params
    params.require(:message).permit(:name, :body, :first_question, :second_question, :third_question, :first_choice, :second_choice, :third_choice)
    # "message"=>{"name"=>"aya", "body"=>"クイズ楽しかったよ！", "first_question"=>"7",
    # "second_question"=>"9", "third_question"=>"11", "first_choice"=>"7", "second_choice"=>"11",
    # "third_choice"=>"13"}
  end
end
