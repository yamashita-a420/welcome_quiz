class Choice < ApplicationRecord
  belongs_to :user
  belongs_to :question
  self.ignored_columns = [:user_id]

  enum correct_answer: { incorrect: 0, correct: 1}

  validates :content, presence: true, length: { maximum: 30 }

  def scoring(choice)
    score = 0
    score += 1 if choice.correct_answer == "correct"
  end
end
