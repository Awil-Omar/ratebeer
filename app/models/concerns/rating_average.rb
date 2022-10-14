module RatingAverage
    extend ActiveSupport::Concern



def average_rating
    # @average  = ratings.score / ratings.count
    ratings.average(:score)
end

end