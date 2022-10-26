class User < ApplicationRecord
  include RatingAverage
  has_secure_password

  validates :username, uniqueness: true, length: { minimum: 3 , maximum: 30}
  validates :password, length: { minimum: 4 }


  has_many :ratings
  has_many :beers, through: :ratings

  def average
    ratings.map(&:score).sum / ratings.count.to_f unless 0
  end

  def to_s
    "#{username}"
  end

  def favorite_beer
    return nil if ratings.empty?

    ratings.sort_by{ |r| r.score }.last.beer
  end
end
