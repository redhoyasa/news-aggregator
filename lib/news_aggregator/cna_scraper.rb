module NewsAggregator
  class CnaScraper < Scraper
    def initialize
      super('https://www.channelnewsasia.com/news/singapore')
    end

    def retrieve_news
      @doc.search('.hero-article h3').each do |li|
        @news.push(
          title: li.text.strip,
          url: 'https://www.channelnewsasia.com' + li.search('a')[0]['href'],
          flag: "\u{1F1F8 1F1EC}"
        )
      end
      @news
    end
  end
end
