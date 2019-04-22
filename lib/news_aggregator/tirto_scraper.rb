module NewsAggregator
  class TirtoScraper < Scraper
    def initialize
      super('https://tirto.id')
    end

    def retrieve_news
      # TODO: check whether the title matches 'POPULER' 
      # instead of hard code the index
      @doc.search('.welcome-title')[7].parent.parent.parent.search('.mb-3 a').each do |li|
        @news.push(
          title: li.text,
          url: @url + li['href'],
          flag: "\u{1F1EE 1F1E9}"
        )
      end
      @news
    end
  end
end
