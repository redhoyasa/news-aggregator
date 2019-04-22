require 'dotenv/load'
require 'telegram/bot'
require 'news_aggregator/scraper'
require 'news_aggregator/detik_scraper'
require 'news_aggregator/tirto_scraper'
require 'news_aggregator/kumparan_scraper'
require 'news_aggregator/mothership_scraper'
require 'news_aggregator/cna_scraper'

module NewsAggregator
  def self.start
    Dotenv.load

    subscriber = ENV['TELEGRAM_GROUP_SUBSCRIBER']
    token = ENV['TELEGRAM_BOT_TOKEN']

    news = []

    # TODO: use builder pattern
    detik_scraper = DetikScraper.new()
    tirto_scraper = TirtoScraper.new()
    kumparan_scraper = KumparanScraper.new()
    mothership_scraper = MothershipScraper.new()
    cna_scraper = CnaScraper.new()

    # append retrieved news to the all news list
    news.concat detik_scraper.retrieve_news()[0..0]
    news.concat tirto_scraper.retrieve_news()[0..0]
    news.concat kumparan_scraper.retrieve_news()[0..0]
    news.concat mothership_scraper.retrieve_news()[0..0]
    news.concat cna_scraper.retrieve_news()[0..0]

    message = message_builder(news)

    Telegram::Bot::Client.run(token) do |bot|
      bot.api.send_message(
        chat_id: subscriber, text: message,
        parse_mode: 'HTML', disable_web_page_preview: true)
    end

  end

  def self.message_builder(news)
    message = "Awali harimu dengan berita \u{1F4F0} dari <b>Seanmctoday</b> by @seanmcbot"

    news.each_with_index do |article, idx|
      message += "\n\n#{idx+1}. <a href='#{article[:url]}'>#{article[:title]} #{article[:flag]}</a>"
    end

    message
  end
end
