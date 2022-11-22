class RatingsController < ApplicationController
  def index
    @ratings = Rating.all
    @recentRatings = Rating.recent
  end

  def new
    @rating = Rating.new
    @beers = Beer.all # fetch list of the beers from the db
  end

  def create
    @rating = Rating.new params.require(:rating).permit(:score, :beer_id)
    @rating.user = current_user

    if @rating.save
      redirect_to user_path current_user
    else
      @beers = Beer.all
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    rating = Rating.find(params[:id])
    rating.delete if current_user == rating.user
    redirect_to user_path(current_user)
  end
end
