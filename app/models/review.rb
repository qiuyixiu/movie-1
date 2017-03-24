class Review < ApplicationRecord
  belongs_to :user
  belongs_to :imovie

  validates :内容, presence: true
  scope :recent, -> { order("created_at DESC")}
end
