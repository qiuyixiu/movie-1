class Imovie < ApplicationRecord
  belongs_to :user
  validates :电影名称, presence: true
end
