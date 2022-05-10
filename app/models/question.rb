class Question < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :user
  has_many :choices, dependent: :destroy

  enum level: { one: 0, twe: 1, three: 2 }

  validates :content, presence: true, length: { maximum: 30 }
  validates :comment, presence: true, length: { maximum: 30 }
end
