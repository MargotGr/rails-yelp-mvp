class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show]

  # GET /restaurants
  # GET /restaurants.json
  def index
    @restaurants = Restaurant.all
  end

  # GET /restaurants/1
  # GET /restaurants/1.json
  def show
  end

  # GET /restaurants/new
  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  # GET /restaurants/1/edit


  # POST /restaurants
  # POST /restaurants.json
  # def create
  #   @restaurant = Restaurant.new(restaurant_params)

  #   respond_to do |format|
  #     if @restaurant.save
  #       format.html { redirect_to @restaurant, notice: 'Restaurant was successfully created.' }
  #       format.json { render :show, status: :created, location: @restaurant }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @restaurant.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # PATCH/PUT /restaurants/1
  # PATCH/PUT /restaurants/1.json
  # def update
  #   respond_to do |format|
  #     if @restaurant.update(restaurant_params)
  #       format.html { redirect_to @restaurant, notice: 'Restaurant was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @restaurant }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @restaurant.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /restaurants/1
  # DELETE /restaurants/1.json
  # def destroy
  #   @restaurant.destroy
  #   respond_to do |format|
  #     format.html { redirect_to restaurants_url, notice: 'Restaurant was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def restaurant_params
      params.require(:restaurant).permit(:name, :address, :phone_number, :category)
    end
end