class CarsController < ApplicationController
  before_action :find_car, only: [:show, :edit, :destroy]

  # GET /cars
  def index
    cars = Car.all
    render json:  CarBlueprint.render(cars)
  end

  # GET /cars/:id
  def show
    render json: CarBlueprint.render(@car)
  end

  # POST /cars?car_type=""&parts_attributes[name]=""
  def create
    @car = Car.new(car_params)

    if @car.save
      render json: CarBlueprint.render(@car)
    else
      render json: car.errors, status: :unprocessable_entity
    end
  end

  # GET /cars/:id/edit?parts_attributes[name]=""&car_type=""
  def edit
    if @car.update(car_params)
      render json: CarBlueprint.render(@car)
    else
      render json: {message: "No update in existing car"}
    end
  end

  # DELETE /cars/:id
  def destroy
    @car.destroy if @car.present?
    render json: {message: "Car deleted successfully"}
  end
 
  private
  def find_car
    @car = Car.find(params[:id])
  rescue => e
    e.message
  end

  def car_params
    params.permit(:car_type, parts_attributes: [:name])
  end
   
end
