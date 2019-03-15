require 'open-uri'
require 'nokogiri'
require 'json'
require 'spec_helper'
require 'news_aggregator/scraper'
require 'news_aggregator/detik_scraper'

describe NewsAggregator::DetikScraper do
  describe "#start" do
    context "when the URL responds successfully" do
      it "crawls websites" do
        news = NewsAggregator::DetikScraper.new().retrieve_news()

        expect(news.title).to eq("PostgreSQL UUID primary keys in Rails 5 | poor effort")
      end
    end
  end
end
