class Quiz < ApplicationRecord
  mount_uploader :photo, QuizTopUploader
  belongs_to :user
  has_many :quiz_tops, dependent: :destroy
  accepts_nested_attributes_for :quiz_tops, allow_destroy: true

  validates :title, presence: true
  validates :explain, presence: true
end
