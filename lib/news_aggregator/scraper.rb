module NewsAggregator
    class Scraper
        MESS = "SYSTEM ERROR: method missing"

        def initialize(url)
            @url = url
            html = open(url)
            @doc = Nokogiri::HTML(html)

            # will contain news
            @news = []
        end

        def retrieve_news
            raise MESS
        end
    end
end
     