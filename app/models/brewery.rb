class Brewery < ApplicationRecord
    include RatingAverage

    has_many :beers
    has_many :ratings, through: :beers

    # def newPrint
    #     self.year = 2022
    #     puts "changed year #{year}"
    # end

   


end
