require 'news_aggregator/scraper'
require 'news_aggregator/detik_scraper'

module NewsAggregator
    def self.start
        detik_scraper = DetikScraper.new('https://www.detik.com')
        puts detik_scraper.retrieve_news()
    end
end
