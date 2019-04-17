module NewsAggregator
  class TirtoScraper < Scraper
    def initialize
      super('https://tirto.id')
    end

    def retrieve_news
      @doc.search('.welcome-title')[7].parent.parent.parent.search('.mb-3 a').each do |li|
        @news.push(
          title: li.text,
          url: @url + li['href']
        )
      end
      @news
    end
  end
end
