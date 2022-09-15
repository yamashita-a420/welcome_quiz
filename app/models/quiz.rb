class Quiz < ApplicationRecord
  belongs_to :user
  has_many :quiz_tops, dependent: :destroy
end
