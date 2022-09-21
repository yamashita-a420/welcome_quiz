class QrcodesController < ApplicationController
  require 'rqrcode'
  require 'rqrcode_png'
  require 'chunky_png'

  def show
    @content = "https://welcome-quiz-maker.com/users/#{current_user.id}/quizzes"
  end
end
