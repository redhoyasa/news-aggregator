require 'open-uri'
require 'nokogiri'
require 'json'
require 'spec_helper'
require 'vcr_helper'
require 'news_aggregator/scraper'
require 'news_aggregator/reuters_scraper'

describe NewsAggregator::ReutersScraper do
  describe "#start" do
    context "when the URL responds successfully" do
      it "crawls from Reuters top story section" do
        VCR.use_cassette :test_crawl_reuters do
          news = NewsAggregator::ReutersScraper.new().retrieve_news()

          expect(news.length).to eq(1) # it contains one news
        end
      end
    end
  end
end
