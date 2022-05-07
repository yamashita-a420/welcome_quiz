class Question < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :user
  has_many :choices, dependent: :destroy

  enum role: { incorrect: 0, correct: 1 }

  validates :content, presence: true, length: { maximum: 30 }
  validates :comment, presence: true, length: { maximum: 30 }
end
