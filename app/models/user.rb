class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :imovies
  has_many :reviews
  has_many :imovie_relationships
  has_many :participated_imovies, :through => :imovie_relationships, :source => :imovie

  def is_member_of?(imovie)
    participated_imovies.include?(imovie)
  end

  def join!(imovie)
    participated_imovies << imovie
  end

  def quit!(imovie)
    participated_imovies.delete(imovie)
  end
  
end
