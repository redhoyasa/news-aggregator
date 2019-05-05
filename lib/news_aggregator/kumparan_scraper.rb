module NewsAggregator
  class KumparanScraper < Scraper
    def initialize
      super('https://kumparan.com/trending')
    end

    def retrieve_news
      # @doc.search('.cZOcBv')[0].parent.search('.drIZFe a span.iNLhyk').each do |li|
      #   @news.push(
      #     title: li.text,
      #     url: @url + li.parent.parent.parent['href'],
      #     flag: "\u{1F1EE 1F1E9}"
      #   )
      # end
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
