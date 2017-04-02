class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_filter :load_resturant

  # GET /reviews
  # GET /reviews.json
  def index
    @reviews = @resturant.reviews
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
    @review = @resturant.reviews.find(params[:id])
  end

  # GET /reviews/new
  def new
    @review = @resturant.reviews.new
  end

  # GET /reviews/1/edit
  def edit
    @review = @resturant.reviews.find(params[:id])
  end

  # POST /reviews
  # POST /reviews.json
  def create
    @review = @resturant.reviews.new(review_params)

    respond_to do |format|
      if @review.save
        format.html { redirect_to [@resturant, @review], notice: 'Review was successfully created.' }
        format.json { render :show, status: :created, location: [@review.resturant, @review] }
      else
        format.html { render :new }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    @review = @resturant.reviews.find(params[:id])

    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to [@resturant, @review], notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: [@resturant, @review] }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review = @resturant.reviews.find(params[:id])
    @review.destroy
    respond_to do |format|
      format.html { redirect_to resturant_reviews_url(@resturant), notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    def load_resturant
      @resturant = Resturant.find(params[:resturant_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:resturant_id, :description, :reviewer, :rating)
    end
end
