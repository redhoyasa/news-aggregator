module NewsAggregator
  class MothershipScraper < Scraper
    def initialize
      super('https://mothership.sg')
    end

    def retrieve_news
      @doc.search('.main-item > .top-story').each do |li|
        @news.push(
          title: li.search('h1').text,
          url: li.search('a')[0]['href'],
          flag: "\u{1F1F8 1F1EC}"
        )
      end
      @news
    end
  end
end
