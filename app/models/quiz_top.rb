class QuizTop < ApplicationRecord
  mount_uploader :photo, QuizTopUploader
  belongs_to :user

  validates :title, presence: true
  validates :explain, presence: true
end
