class RatingsController < ApplicationController
  def index
    
    @ratings = Rating.all
  end

  def new
    @rating = Rating.new
    @beers = Beer.all #fetch list of the beers from the db
  end
  
  def create
    Rating.create params.require(:rating).permit(:score, :beer_id)
    redirect_to ratings_path
  end

  def destroy
    rating = Rating.find(params[:id])
    rating.delete
    redirect_to ratings_path
  end

end