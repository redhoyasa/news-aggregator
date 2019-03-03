require 'rake'
require 'open-uri'
require 'nokogiri'
require 'json'

$LOAD_PATH << File.join(File.dirname(__FILE__), 'lib')
require 'news_aggregator'

namespace :news_aggregator do
    desc 'Start scraper'
    task :start do
        NewsAggregator.start
    end
end

task default: 'news_aggregator:start'
