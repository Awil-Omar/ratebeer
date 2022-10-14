class BreweriesController < ApplicationController
  before_action :set_brewery, only: %i[ show edit update destroy ]
  before_action :authenticate, only: [:destroy]

 
  # GET /breweries or /breweries.json
  def index
    @breweries = Brewery.all
  end

 

  # GET /breweries/1 or /breweries/1.json
  def show
    @breweries = Brewery.find(params[:id])
  end

  # GET /breweries/new
  def new
    @brewery = Brewery.new
  end

  # GET /breweries/1/edit
  def edit
  end

  # POST /breweries or /breweries.json
  def create
    @brewery = Brewery.new(brewery_params)

    respond_to do |format|
      if @brewery.save
        format.html { redirect_to brewery_url(@brewery), notice: "Brewery was successfully created." }
        format.json { render :show, status: :created, location: @brewery }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @brewery.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /breweries/1 or /breweries/1.json
  def update
    respond_to do |format|
      if @brewery.update(brewery_params)
        format.html { redirect_to brewery_url(@brewery), notice: "Brewery was successfully updated." }
        format.json { render :show, status: :ok, location: @brewery }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @brewery.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /breweries/1 or /breweries/1.json
  def destroy
    @brewery.destroy

    respond_to do |format|
      format.html { redirect_to breweries_url, notice: "Brewery was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_brewery
      #go the db:Brewery and find the passed parameter from the console and then save it to @brewery var
      @brewery = Brewery.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def brewery_params
      params.require(:brewery).permit(:name, :year)
    end

     # ...
  private
  # ...
  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      raise "Wrong username or password" unless username == "admin" and password == "secret"
      return true
    end
  end
end