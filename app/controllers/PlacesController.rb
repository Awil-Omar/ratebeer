class PlacesController < ApplicationController
  def index
  end

  def search
    @places = BeermappingApi.places_in(params[:city])
    if @places.empty?
      redirect_to places_path, notice: "No locations in #{params[:city]}"
    else
      render :index, status: 418
    end

  end
  def show
    #store the cache session city in foundcity var
    found_city = Rails.cache.read session[:city]
    @place_id= nil
    found_city.each do |found|
      @place_id = found if found.id == params[:id]
    end
    @place_id
  end


end