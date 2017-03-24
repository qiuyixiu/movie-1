class Imovie < ApplicationRecord
  belongs_to :user
  has_many :reviews
  validates :电影名称, presence: true
end
