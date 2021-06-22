class Api::V1::RestaurantsController < ApplicationController
  before_action :set_restaurant, only: %i[ show update destroy ]

  # GET /restaurants
  # GET /restaurants.json
  def index
    @restaurants = Restaurant.all
    render json: RestaurantSerializer.new(@restaurants)
  end

  # GET /restaurants/1
  # GET /restaurants/1.json
  def show
    render json: RestaurantSerializer.new(@restaurant)
  end

  # POST /restaurants
  # POST /restaurants.json
  def create
    @restaurant = Restaurant.new(restaurant_params)

    if @restaurant.save
      render json: RestaurantSerializer.new(@restaurant)
    else
      render json: @restaurant.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /restaurants/1
  # PATCH/PUT /restaurants/1.json
  def update
    if @restaurant.update(restaurant_params)
      render json: RestaurantSerializer.new(@restaurant)
    else
      render json: @restaurant.errors, status: :unprocessable_entity
    end
  end

  # DELETE /restaurants/1
  # DELETE /restaurants/1.json
  def destroy
    @restaurant.destroy
    render json: RestaurantSerializer.new(@restaurant)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def restaurant_params
      params.require(:restaurant).permit(:name, :street, :city, :state, :desc, :user_id, :live)
    end
end
