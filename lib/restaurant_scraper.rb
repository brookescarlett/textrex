require 'nokogiri'
require_relative './restaurant.rb'

class RestaurantScraper

  def initialize(index_url)
    @index_url = index_url
    @doc = Nokogiri::HTML(open(index_url))
  end

  def call
    rows.each do |row_doc|
      Restaurant.create_restaurant(scrape_row(row_doc))
    end
  end

  private
    def rows
      @rows ||= @doc.search("div.spot-block")
    end

    def scrape_row(row)
      {
        :name => row.search(".spot-block__title h3").text,
        :location => row.search(".spot-block__neighborhoods a").text.gsub("\n", "").delete(" "),
        :address => row.search("small").text,
        :description => row.search(".spot-block__description").text,
      }
    end

end
