# frozen_string_literal: true
class CarBlueprint < Blueprinter::Base
  identifier :id

  field :parts do |data|
    data.parts.map {  |part| part.name }
  end  

  fields :car_type
end
