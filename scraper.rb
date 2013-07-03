require "nokogiri"
require "open-uri"

File.open('quotes.txt', 'w') do |f|
    (1..15).each do |num|
        puts num
        doc = Nokogiri::HTML(open("http://www.goodreads.com/quotes/tag/inspirational-quotes?page=#{num}"))

        doc.css('.quoteText').each do |quote|
            f.puts quote.text.gsub(/\s+/, ' ')
        end
    end
end
