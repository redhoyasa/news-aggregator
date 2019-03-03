module NewsAggregator
    class Scraper
        
        def initialize(url)
            @url = url
            html = open(url)
            @doc = Nokogiri::HTML(html)
            @news = []
        end
    end
end
     