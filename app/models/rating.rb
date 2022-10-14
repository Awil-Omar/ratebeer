class Rating < ApplicationRecord
    belongs_to :beer

    def average_rating
        @average = ratings.score
    
      end

  
end
