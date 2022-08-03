class QuestionChoiceForm
  include ActiveModel::Model
  include ActiveModel::Attributes
  extend CarrierWave::Mount

  attr_accessor :photo_cache

  attribute :photo, :string
  attribute :question_content, :string
  attribute :comment, :string
  attribute :level, :integer, default: 0
  attribute :choice_content, :string
  attribute :correct_answer, :string

  mount_uploader :photo, :PhotoUploader

  validates_presence_of %i(
    question_content
    choice_content
    correct_answer
  )

  def save_question!
    question = Question.new(content: question_content, comment: comment, level: level).save!
    question.photo.build(photo: photo, photo_cache: photo_cache).save! if photo
    return question
  end

  def save_choice!
    choice = Choice.new(content: choice_content, correct_answer: correct_answer).save!
    return choice
  end
end
