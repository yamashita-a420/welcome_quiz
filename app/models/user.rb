class User < ApplicationRecord
  authenticates_with_sorcery!
  has_many :questions, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_one :quiz_top, dependent: :destroy

  validates :name, presence: true
  validates :email, uniqueness: true, presence: true
  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :reset_password_token, uniqueness: true, allow_nil: true

  enum role: { general: 0, admin: 1 }

  after_validation :set_quiz_top, on: [ :create ]

  private

  def set_quiz_top
    self.quiz_top = QuizTop.create
  end
end
