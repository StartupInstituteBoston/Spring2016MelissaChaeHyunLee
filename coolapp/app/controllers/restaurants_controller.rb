class RestaurantsController < ApplicationController

  before_action :authenticate_owner!, except: [:index, :show]

  def new
    @restaurant = current_owner.restaurants.new
  end

  def edit
    @restaurant = current_owner.restaurants.find_by_id(params[:id])
    return redirect_to restaurants_url, notice: "cannot edit restaurant" unless @restaurant
  end

  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def create
    @restaurant = current_owner.restaurants.new(restaurant_params)
    @restaurant.owner = current_owner

    if @restaurant.save
      redirect_to @restaurant
    else
      render 'new'
    end
  end

  def update
    @restaurant = current_owner.restaurants.find_by_id(params[:id])

    if @restaurant.update(restaurant_params)
      redirect_to @restaurant
    else
      render 'edit'
    end
  end

  def destroy
    @restaurant = current_owner.restaurants.find_by_id(params[:id])
    return redirect_to restaurants_url, notice: "cannot delete restaurant" unless @restaurant
    @restaurant.destroy

    redirect_to restaurants_path
  end

  private
  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone, :description)
  end
end
