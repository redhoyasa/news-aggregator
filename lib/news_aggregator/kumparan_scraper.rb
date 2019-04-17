module NewsAggregator
  class KumparanScraper < Scraper
    def initialize
      super('https://kumparan.com')
    end

    def retrieve_news
      # TODO: check whether the title matches 'Trending' 
      # instead of hard code the index
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
