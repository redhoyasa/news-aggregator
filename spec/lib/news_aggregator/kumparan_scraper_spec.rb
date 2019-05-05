require 'open-uri'
require 'nokogiri'
require 'json'
require 'spec_helper'
require 'vcr_helper'
require 'news_aggregator/scraper'
require 'news_aggregator/kumparan_scraper'

describe NewsAggregator::KumparanScraper do
  describe "#start" do
    context "when the URL responds successfully" do
      it "crawls from Kumparan trending news section" do
        VCR.use_cassette :test_crawl_kumparan do
          news = NewsAggregator::KumparanScraper.new().retrieve_news()

          expect(news.length).to eq(10) # it contains ten news
        end
      end
    end
  end
end
