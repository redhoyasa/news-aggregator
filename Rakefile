require 'rake'
require 'open-uri'
require 'nokogiri'
require 'json'
require 'rspec/core/rake_task'

$LOAD_PATH << File.join(File.dirname(__FILE__), 'lib')
require 'news_aggregator'

namespace :news_aggregator do
  desc 'Start scraper'
  task :start do
      NewsAggregator.start
  end
end

RSpec::Core::RakeTask.new(:spec) do |t|
  t.pattern = Dir.glob('spec/**/*_spec.rb')
  t.rspec_opts = '--format documentation'
end

task default: :spec
