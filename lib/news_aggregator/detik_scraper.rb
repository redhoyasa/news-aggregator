module NewsAggregator
    class DetikScraper < Scraper
        def retrieve_news
            @doc.search('#box-pop2 ul li article a').each do |li|
                @news.push(
                    title: li.search('h2').text,
                    url: li['href']
                )
            end
            @news
        end
    end
end