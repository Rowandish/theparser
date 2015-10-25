class CinemaParser
  require 'nokogiri'
  require 'open-uri'

  def initialize
    return if @cinema.nil?
    @cinema.films.each(&:destroy)
    @doc = Nokogiri::HTML(open(@cinema.webpage))
  end

  def parse
    p 'Not implemented'
  end
end
