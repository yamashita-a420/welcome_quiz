class Choice < ApplicationRecord
  belongs_to :user
  belongs_to :question
  
  enum correct_answer: { incorrect: 0, correct: 1}

  validates :content, presence: true, length: { maximum: 30 }
end
