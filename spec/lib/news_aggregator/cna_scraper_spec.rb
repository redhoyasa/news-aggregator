require 'open-uri'
require 'nokogiri'
require 'json'
require 'spec_helper'
require 'vcr_helper'
require 'news_aggregator/scraper'
require 'news_aggregator/cna_scraper'

describe NewsAggregator::CnaScraper do
  describe "#start" do
    context "when the URL responds successfully" do
      it "crawls from Channel News Asia Singapore news section" do
        VCR.use_cassette :test_crawl_cna do
          news = NewsAggregator::CnaScraper.new().retrieve_news()

          expect(news.length).to eq(3) # it contains one news
        end
      end
    end
  end
end
