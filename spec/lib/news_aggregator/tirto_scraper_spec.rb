require 'open-uri'
require 'nokogiri'
require 'json'
require 'spec_helper'
require 'vcr_helper'
require 'news_aggregator/scraper'
require 'news_aggregator/tirto_scraper'

describe NewsAggregator::TirtoScraper do
  describe "#start" do
    context "when the URL responds successfully" do
      it "crawls from Tirto popular news section" do
        VCR.use_cassette :test_crawl_tirto do
          news = NewsAggregator::TirtoScraper.new().retrieve_news()

          expect(news.length).to eq(4) # it contains four news
        end
      end
    end
  end
end
