class Car < ApplicationRecord
  has_many :parts, dependent: :destroy
  accepts_nested_attributes_for :parts, reject_if: :all_blank, allow_destroy: true

  enum :car_type, [ :electrical, :two_wheels, :sport ]

  def parts_attributes=(parts_attributes)
    parts_names = parts_attributes["name"].split(",").map(&:strip)
    
    parts_names.each do |part_name|
      parts.build(name: part_name)
    end
  end
end
