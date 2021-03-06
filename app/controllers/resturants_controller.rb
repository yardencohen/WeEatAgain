class ResturantsController < ApplicationController
  before_action :set_resturant, only: [:show, :edit, :update, :destroy, :distance_calc]

  # GET /resturants
  # GET /resturants.json
  def index
    @resturants = Resturant.all
    @resturantlist = @resturants.map do |resturant|
      {
          :id => resturant.id,
          :name => resturant.name,
          :max_delivery_time => resturant.max_delivery_time,
          :tenbis => resturant.tenbis,
          :average_rating => resturant.average_rating,
          :cuisine_title => resturant.cuisine.title,
          :cuisine_image => ActionController::Base.helpers.asset_path(resturant.cuisine.image),
          :new_review => new_resturant_review_path(resturant)
      }
    end
    @cuisine_titles = Cuisine.pluck(:title)
  end

  # GET /resturants/1
  # GET /resturants/1.json
  def show
  end

  # GET /resturants/new
  def new
    @cuisines = Cuisine.all
    @resturant = Resturant.new
  end

  # GET /resturants/1/edit
  def edit
  end

  # POST /resturants
  # POST /resturants.json
  def create
    @resturant = Resturant.new(resturant_params)

    respond_to do |format|
      if @resturant.save
        format.html { redirect_to root_url, notice: 'Resturant was successfully created.' }
        format.json { render :show, status: :created, location: @resturant }
      else
        format.html { render :new }
        format.json { render json: @resturant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /resturants/1
  # PATCH/PUT /resturants/1.json
  def update
    respond_to do |format|
      if @resturant.update(resturant_params)
        format.html { redirect_to @resturant, notice: 'Resturant was successfully updated.' }
        format.json { render :show, status: :ok, location: @resturant }
      else
        format.html { render :edit }
        format.json { render json: @resturant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resturants/1
  # DELETE /resturants/1.json
  def destroy
    @resturant.destroy
    respond_to do |format|
      format.html { redirect_to resturants_url, notice: 'Resturant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def distance_calc
    origin = {lat: distance_calc_params[:latitude], lng: distance_calc_params[:longitude]}
    @distance = GoogleDistanceMatrix.new.calc_distance(origin, @resturant.address)
    render json: @distance
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resturant
      @resturant = Resturant.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def resturant_params
      params.require(:resturant).permit(:name, :tenbis, :address, :max_delivery_time, :cuisine_id)
    end

    def distance_calc_params
      params[:user_location].permit(:latitude, :longitude)
    end
end
