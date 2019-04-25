$LOAD_PATH = Dir['./vendor/bundle/ruby/2.5.0/gems/**/lib', './lib']
require 'open-uri'
require 'nokogiri'
require 'json'
require 'news_aggregator'

def seanmctoday_telegram(event:, context:)
  NewsAggregator.start
  { statusCode: 200, body: JSON.generate('Success to send news!') }
end
