class Question < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :user
  has_many :choices, dependent: :destroy, inverse_of: :question
  accepts_nested_attributes_for :choices, allow_destroy: true

  enum level: { one: 0, two: 1, three: 2 }

  validates :content, presence: true, length: { maximum: 30 }
  validates :comment, presence: true, length: { maximum: 30 }
end
