class ChangeDataTypeForCarTypeInCars < ActiveRecord::Migration[7.0]
  def change
    change_column(:cars, :car_type, :integer)
  end
end
