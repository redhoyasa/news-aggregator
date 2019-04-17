module NewsAggregator
  class KumparanScraper < Scraper
    def initialize
      super('https://kumparan.com')
    end

    def retrieve_news
      @doc.search('.cZOcBv')[0].parent.search('.drIZFe a span.iNLhyk').each do |li|
        @news.push(
          title: li.text,
          url: @url + li.parent.parent.parent['href']
        )
      end
      @news
    end
  end
end
