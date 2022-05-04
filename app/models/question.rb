class Question < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :user
  has_many :choice, dependent: :destroy

  validates :content, presence: true, length: { maximum: 30 }
  validates :comment, presence: true, length: { maximum: 30 }
end
