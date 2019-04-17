require 'open-uri'
require 'nokogiri'
require 'json'
require 'spec_helper'
require 'vcr_helper'
require 'news_aggregator/scraper'
require 'news_aggregator/detik_scraper'

describe NewsAggregator::DetikScraper do
  describe "#start" do
    context "when the URL responds successfully" do
      it "crawls from Detik.com popular news section" do
        VCR.use_cassette :test_crawl_detik do
          news = NewsAggregator::DetikScraper.new().retrieve_news()

          expect(news.length).to eq(10) # it has ten news
        end
      end
    end
  end
end
