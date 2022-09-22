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

  after_create :set_top_and_quizzes

  private

  def set_top_and_quizzes
    self.quiz_top = QuizTop.create
    self.questions.create([
      {
        content: 'ここはどこでしょう？',
        comment: '記念日に行きました',
        level: 0,
        choices_attributes: [
          {
            content: '京都',
            correct_answer: 1,
          },
          {
            content: '横浜',
            correct_answer: 0,
          },
        ],
      },
      {
        content: 'おすすめの名物はなんでしょう？',
        comment: '甘すぎなくて美味しいです',
        level: 1,
        choices_attributes: [
          {
            content: 'どら焼き',
            correct_answer: 1,
          },
          {
            content: 'たい焼き',
            correct_answer: 0,
          },
        ],
      },
      {
        content: 'なにをしたでしょう？',
        comment: '翌日足が痛かったです',
        level: 2,
        choices_attributes: [
          {
            content: '散策',
            correct_answer: 0,
          },
          {
            content: 'サイクリング',
            correct_answer: 0,
          },
          {
            content: '座禅',
            correct_answer: 1,
          },
        ],
      },
    ])
  end
end
