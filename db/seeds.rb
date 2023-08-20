# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

electricCar = Car.create(car_type: "electrical")
electricCar.parts.create(name: "mirrors")
electricCar.parts.create(name: "car battery")

sportsCar = Car.create(car_type: "sport")
sportsCar.parts.create(name: "Tail lights")
sportsCar.parts.create(name: "Low ring springs")
