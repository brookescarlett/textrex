require_relative './restaurant_scraper.rb'
require_relative '../config/environment.rb'

class Restaurant < ActiveRecord::Base

  def self.create_restaurant(params)
    Restaurant.create(name: params[:name], location: params[:location], address: params[:address], description: params[:description])
  end

  def self.location_match(location)
    found_restaurants = Restaurant.where(location: location)
    random_number = rand(found_restaurants.length)
    picked = found_restaurants[random_number]
    puts "Tonight you'll be dining at #{picked.name}!"
  end

  def self.return_description
    found_restaurant = Restaurant.all.sample
    puts "Tonight you'll be dining at #{found_restaurant.name} located at #{found_restaurant.address}. Here's our review: #{found_restaurant.description}"
  end

  def self.update_location
    Restaurant.where(:location => ["FlatironGramercyMurrayHill", "LowerEastSide", "EastVillage", "Chinatown"]).update_all(:location => "East Village")

    Restaurant.where(:location => ["GreenwichVillage", "WestVillage", "Chelsea", "ChelseaMeatpackingDistrict", "Tribeca"]).update_all(:location => "West Village")

    Restaurant.where(:location => ["Williamsburg", "BrooklynBushwick", "BrooklynParkSlope", "Greenpoint", "BrooklynWilliamsburg", "Bushwick",  "BrooklynGowanus", "BrooklynDUMBO", "BrooklynSunsetPark", "BrooklynGreenpoint", "BrooklynCarrollGardens"]).update_all(:location => "Brooklyn")

    Restaurant.where(:location => ["NOHO", "SoHo", "Nolita"]).update_all(:location => "SoHo")

    Restaurant.where(:location => ["Nomad", "FlatironGramercy", "Gramercy"]).update_all(:location => "Flatiron")

    Restaurant.where(:location => ["LongIslandCityQueens"]).update_all(:location => "Midtown")

    Restaurant.where(:location => ["MidtownEast", "Midtown", "MidtownTimesSquare", "ColumbusCircleMidtown"]).update_all(:location => "Queens")

    Restaurant.where(:location => ["UpperEastSide", "UpperWestSide"]).update_all(:location => "Uptown")

    Restaurant.where(location: "").delete_all
  end



end
