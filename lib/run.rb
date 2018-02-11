require_relative "./restaurant_scraper.rb"
require_relative "./restaurant.rb"
require 'sinatra/activerecord'

require 'pry'

class Bot

  attr_accessor :response

  colorizer = Lolize::Colorizer.new

  URL_HASH = {
    "mexican" => "https://www.theinfatuation.com/new-york/guides/best-mexican-restaurants-nyc",
    "sushi" => "https://www.theinfatuation.com/new-york/guides/nycs-best-casual-neighborhood-sushi-spots",
    "italian" => "https://www.theinfatuation.com/new-york/guides/best-italian-restaurants-nyc",
    "greatest_hits" => "https://www.theinfatuation.com/new-york/guides/best-restaurants-in-nyc-greatest-hits-list"
  }

  def welcome
    puts "Welcome to TextRex, I'll tell you where to eat tonight"
    sleep(0.5)
    puts "Do you want some options, or are you feeling lucky?"
    prompt_user
  end

  def prompt_user
    sleep(0.5)
    puts "Type 'options' for some options or 'lucky' if you are feeling lucky"
  end

  def get_user_input
    response = gets.chomp
  end

  def first_response
    response = get_user_input
      if response == "options"
        puts "Would you like italian, mexican or sushi?"
        cuisine_response = gets.chomp
        options(cuisine_response)
      elsif response == "lucky"
        lucky
      else
        invalid_command
      end
  end

  def options(cuisine_response)
    #starts new scrape
    url = URL_HASH[cuisine_response]
    scrape = RestaurantScraper.new(url)

    restaurant_instance = scrape.call

    #iterates through location options and shows user their choices
    Restaurant.update_location
    location_options = Restaurant.all.map {|obj| obj.location}.uniq!.sort
    puts "Where would you like to eat?"
    location_options.each do |location|
      puts location
    end

    # gets response and calls location_matcher
    location_choice = gets.chomp

    Restaurant.location_match(location_choice)
  end

  ##response if lucky
  def lucky
    scrape = RestaurantScraper.new(URL_HASH["greatest_hits"])
    restaurant_instance = scrape.call
    Restaurant.return_description
  end

  ##invalid command
  def invalid_command
    puts "Please enter a valid command!"
    prompt_user
    get_user_input
  end

  def end_text
    sleep (0.5)
    puts "Happy dining!"
  end

  ##run
  def runner
    b = true
    Restaurant.delete_all
    welcome
    while b == true
      first_response
      b = false
    end
      end_text
  end

end
