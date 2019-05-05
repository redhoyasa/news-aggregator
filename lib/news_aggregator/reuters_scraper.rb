module NewsAggregator
  class ReutersScraper < Scraper
    def initialize
      super('https://www.reuters.com')
    end

    def retrieve_news
      @doc.search('#topStory').search('h2 a').each do |li|
        @news.push(
          title: li.text,
          url: @url + li['href'],
          flag: "\u{1F30F}"
        )
      end
      @news
    end
  end
end
