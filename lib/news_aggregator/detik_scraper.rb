module NewsAggregator
  class DetikScraper < Scraper
    def initialize
      super('https://www.detik.com')
    end

    def retrieve_news
      @doc.search('#box-pop2 ul li article a').each do |li|
        @news.push(
          title: li.search('h2').text,
          url: li['href'],
          flag: "\u{1F1EE 1F1E9}"
        )
      end
      @news
    end
  end
end
