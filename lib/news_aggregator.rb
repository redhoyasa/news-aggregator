require 'news_aggregator/scraper'
require 'news_aggregator/detik_scraper'
require 'news_aggregator/tirto_scraper'

require 'news_aggregator/kumparan_scraper'

module NewsAggregator
  def self.start
    news = []

    # TODO: use builder pattern
    detik_scraper = DetikScraper.new()
    tirto_scraper = TirtoScraper.new()
    kumparan_scraper = KumparanScraper.new()

    # append retrieved news to the all news list
    news.concat detik_scraper.retrieve_news() 
    news.concat tirto_scraper.retrieve_news() 
    news.concat kumparan_scraper.retrieve_news() 

    puts news
  end
end
