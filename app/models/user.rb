class User < ApplicationRecord
  include RatingAverage
  has_secure_password

  validates :username, uniqueness: true, length: { minimum: 3 , maximum: 30}
  validates :password, length: { minimum: 4 }

  #validates :user_id, numericality: { greater_than_or_equal_to: 3, less_than_or_equal_to: 30 }
  has_many :ratings
  has_many :beers, through: :ratings

  def average
    ratings.map(&:score).sum / ratings.count.to_f unless 0
  end
end
