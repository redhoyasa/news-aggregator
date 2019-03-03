require 'open-uri'
require 'nokogiri'
require 'json'

class Scraper

    def initialize(url)
        @url = url
        html = open(url)
        @doc = Nokogiri::HTML(html)
        @news = []
    end

end
     