class Choice < ApplicationRecord
  belongs_to :user
  belongs_to :question

  enum correct_answer: { incorrect: 0, correct: 1}

  validates :content, presence: true, length: { maximum: 30 }

  def scoring(choice)
    score = 0
    score += 1 if choice.correct_answer == "correct"
    #binding.pry
    puts score.to_i
  end

  #def self.scoring(*choices)
  #  score = 0
  #  choices.each do |choice|
  #    #binding.pry
  #    if choice.correct_answer == 1
  #      #binding.pry
  #      score += 1
  #    end
  #  end
  #end
end
