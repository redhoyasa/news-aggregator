module NewsAggregator
  class KumparanScraper < Scraper
    def initialize
      super('https://kumparan.com/trending')
    end

    def retrieve_news
      @doc.search('div[@data-qa-id="news-item"]').each do |li|
        @news.push(
          title: li.search('a')[0].text,
          url: @url + li.search('a')[0]['href'],
          flag: "\u{1F1EE 1F1E9}"
        )
      end
      @news
    end
  end
end
