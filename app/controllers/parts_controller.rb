class PartsController < ApplicationController
  before_action :find_car_part

  # DELETE /cars/:car_id/parts/:id
  def destroy
    @part.destroy
    render json: {message: 'Part was successfully deleted.'}
  end

  # GET /cars/:car_id/parts/:id/edit?part[name]=""
  def edit
    if @part.update(part_params)
      render json: @part, status: :ok
    else
      render json: @part.errors, status: :unprocessable_entity
    end
  end

  private

  def part_params
    params.require(:part).permit(:name)
  end

  def find_car_part
    @part = Car.find(params[:car_id]).parts.find(params[:id])
  rescue => e
    e.message
  end
end
