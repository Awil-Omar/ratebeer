class User < ApplicationRecord
  include RatingAverage
  has_secure_password

  validates :username, uniqueness: true, length: { minimum: 3 , maximum: 30}
  validates :password, length: { minimum: 4 }


  has_many :ratings, dependent: :destroy
  has_many :memberships, dependent: :destroy
  has_many :beer_clubs, through: :memberships
  has_many :beers, through: :ratings

  scope :admin, -> { where admin: true }

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

  def favorite_style()
    return nil if ratings.empty?


  end
end
