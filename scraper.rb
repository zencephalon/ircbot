# encoding: UTF-8
require "nokogiri"
require "open-uri"

File.open('perks_quotes.txt', 'w') do |f|
    (1..9).each do |num|
        puts num
        doc = Nokogiri::HTML(open("http://www.goodreads.com/author/quotes/12898.Stephen_Chbosky?page=#{num}"))

        doc.css('.quoteText').each do |quote|
            f.puts quote.text.gsub(/\s+/, ' ').gsub(/― Stephen Chbosky, The Perks of Being a Wallflower/, '').gsub(/― Stephen Chbosky/, '').gsub('“','').gsub('”','')
        end
    end
end

