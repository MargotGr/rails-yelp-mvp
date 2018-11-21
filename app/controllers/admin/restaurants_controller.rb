class Admin::RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:edit, :update, :destroy]

  def index
    # Let's anticipate on next week (with login)
    @restaurants = current_user.restaurants
  end

  def edit
  end

  def update
    if @restaurant.update(restaurant_params)
      redirect_to restaurant_path(@restaurant)
    else
      render :edit
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end

    def restaurant_params
      params.require(:restaurant).permit(:name, :address, :phone_number, :category)
    end
end
