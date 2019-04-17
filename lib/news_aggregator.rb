require 'news_aggregator/scraper'
require 'news_aggregator/detik_scraper'

module NewsAggregator
  def self.start
    news = []
    detik_scraper = DetikScraper.new()

    # append retrieved news to the all news list
    news.concat detik_scraper.retrieve_news() 
    
    puts news
  end
end
