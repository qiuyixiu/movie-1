class Imovie < ApplicationRecord
  belongs_to :user
  has_many :reviews
  validates :电影名称, presence: true
  has_many :imovie_relationships
  has_many :members, through: :imovie_relationships, source: :user 
end
