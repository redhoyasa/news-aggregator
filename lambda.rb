load_paths = Dir['./lib']
$LOAD_PATH.unshift(*load_paths)

require 'open-uri'
require 'nokogiri'
require 'news_aggregator'
require 'json'


def seanmctoday_telegram(event:, context:) 
  NewsAggregator.start
  { statusCode: 200, body: JSON.generate('Success to send news!') }
end
