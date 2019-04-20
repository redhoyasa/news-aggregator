require 'open-uri'
require 'nokogiri'
require 'json'
require 'spec_helper'
require 'vcr_helper'
require 'news_aggregator/scraper'
require 'news_aggregator/mothership_scraper'

describe NewsAggregator::MothershipScraper do
  describe "#start" do
    context "when the URL responds successfully" do
      it "crawls from Mothership.sg top news section" do
        VCR.use_cassette :test_crawl_mothership do
          news = NewsAggregator::MothershipScraper.new().retrieve_news()

          expect(news.length).to eq(1) # it contains one news
        end
      end
    end
  end
end
