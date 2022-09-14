class MessagesController < ApplicationController
  skip_before_action :require_login, only: %i[new create show]
  before_action :set_result, only: %i[create show]

  def index
    @messages = current_user.messages.order(created_at: :desc)
  end

  def new
    @message = Message.new
    @user = User.find(params[:user_id])
    #表示するquestion
    @quiz_1 = Question.find(params[:quiz_1])
    @quiz_2 = Question.find(params[:quiz_2])
    @quiz_3 = Question.find(params[:quiz_3])
    #回答したchoiceの情報
    @choice_1 = Choice.find(params[:choice_1])
    @choice_2 = Choice.find(params[:choice_2])
    @choice_3 = Choice.find(params[:choice_3])
    #正解数
    @score = [@choice_1, @choice_2, @choice_3].map{|x| x.scoring(@choice_1)}.map(&:to_i).sum
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to user_result_message_sent_path(message: quiz_params)
    else
      redirect_to user_result_message_sent_path(message: quiz_params)
    end
  end

  def show
    @message = Message.find_by(message_params)
    @new_message = Message.new(message_params)
    @user = User.find(params[:user_id])
  end

  def destroy
    @message = current_user.messages.find(params[:format])
    @message.destroy
    redirect_to messages_url, notice: "Create question was successfully destroyed."
  end

  private

  def set_result
    # 表示するquestion
    @quiz_1 = Question.find(params[:message][:quiz_1])
    @quiz_2 = Question.find(params[:message][:quiz_2])
    @quiz_3 = Question.find(params[:message][:quiz_3])
    # 回答したchoiceの情報
    @choice_1 = Choice.find(params[:message][:choice_1])
    @choice_2 = Choice.find(params[:message][:choice_2])
    @choice_3 = Choice.find(params[:message][:choice_3])
    # 正解数
    @score = [@choice_1, @choice_2, @choice_3].map{|x| x.scoring(x)}.map(&:to_i).sum
  end

  def message_params
    params.require(:message).permit(:name, :body).merge(user_id: params[:user_id])
  end

  def quiz_params
    params.require(:message).permit(:quiz_1, :quiz_2, :quiz_3, :choice_1, :choice_2, :choice_3).to_h
  end
end
