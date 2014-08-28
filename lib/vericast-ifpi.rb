require 'nokogiri'
require 'open-uri'

module VericastIFPI

  BASE_URL = 'http://vericast.bmat.me/ifpi/search?lang=en'

  class Song
    attr_reader :artist_name, :song_title, :label, :isrc
    def initialize( artist_name, song_title, label, isrc )
      @artist_name, @song_title, @label, @isrc = artist_name, song_title, label, isrc
    end
  end

  def song_lookup( params )
    results, search_url = [], BASE_URL

    params.each { |p, v| search_url += "&#{p}=#{URI.encode(v)}" }

    page = Nokogiri::HTML( open(search_url).read() )
    matches = page.xpath("//div[@class='info_search_head']/text()").inner_text().strip().match(/Found (.+) result/)
    if matches
      number_of_results = matches[1].to_i
      page.xpath("//table[contains(@class, 'table table-striped')]/tbody/tr").each do |tr|
        p tr.xpath(".//td/text()").map { |e| e.inner_text().strip() }
      end
    end

    results
  end

end

include VericastIFPI

song_lookup artist: 'nirvana', track: 'come as you are', country: 'us'
